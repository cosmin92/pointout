class DashboardController < ApplicationController
  before_action :authenticate_forwarder!

  layout "backend"

  def index
    @reports = Report.take(10)
  end

  #edit group
  def edit_group
    @group = current_forwarder.group
  end

  def update_group
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update( params.require(:group).permit(:name, :description, :logo))
        format.html {redirect_to dashboard_index_path, notice: 'Report was successfully updated.'}
        format.json {render :show, status: :ok, location: @report}
      else
        format.html {redirect_to dashboard_index_path}
        format.json {render json: @report.errors, status: :unprocessable_entity}
      end
    end
  end

  # create contacts
  def create_contact
    Contact.create(agency_id: params[:id], address_book_id: params[:address_book_id])
    redirect_to agencies_path
  end

  # reports
  def reports
    @reports = Report.where("tipology_id IN (?)", current_forwarder.group.tipologies.select(:id))
    @reports = @reports.where(state: "Pending")
  end

  def show_report
    @report = Report.find(params[:id])
  end

  def forward_report
    @report = Report.find(params[:id])
    @agency = Agency.find(params[:agency_id])


    AgencyMailer.send_email_to(@agency, @report).deliver_now
    SignalerMailer.send_email_to(@report.signaler, @report, @agency).deliver_now
    @report.state = "Forwarded"
    @report.forward_date= Time.now

    @report.forwarder_id = current_forwarder.id
    @report.agency_id = @agency.id
    @report.save

    redirect_to dashboard_reports_path
  end

  def my_forwards
    @reports = current_forwarder.reports
  end

  # Agencies
  def my_agencies
    @agencies = current_forwarder.agencies
  end

  # Occupations
  def occupations
    @tipologies = current_forwarder.group.tipologies
  end

  def create_occupation

    if current_forwarder.boss
      Occupation.create(:group => current_forwarder.group, :tipology => Tipology.find(params[:id]))
    end

    redirect_to tipologies_path
  end

  def remove_occupation

    if current_forwarder.boss
      Occupation.where("group_id = ? AND tipology_id = ?", current_forwarder.group.id, params[:id]).first.destroy
    end

    redirect_to occupations_path
  end

  # memebers
  def members
    @members = current_forwarder.group.forwarders.where.not(id: current_forwarder.id)
  end

  def make_boss
    @forwarder = Forwarder.find(params[:id])
    @forwarder.boss = true
    @forwarder.save
    redirect_to dashboard_members_path
  end

  def remove_boss
    @forwarder = Forwarder.find(params[:id])
    @forwarder.boss = false
    @forwarder.save
    redirect_to dashboard_members_path
  end

end
