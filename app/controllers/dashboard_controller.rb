class DashboardController < ApplicationController
  before_action :authenticate_forwarder!
  
  layout "backend"

  def index
    @reports = Report.take(10)
  end

  # reports
  def reports
    @reports = Report.where("tipology_id IN (?)", current_forwarder.group.tipologies.select(:id))
  end

  def show_report
    @report = Report.find(params[:id])
  end

  def forward_report
    puts "==================================================================================="
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
    @occupations = current_forwarder.group.occupations
  end

  def create_occupation

    if current_forwarder.boss
      Occupation.create(:group => current_forwarder.group, :tipology => Tipology.find(params[:id]))
    end

    redirect_to tipologies_path
  end

end
