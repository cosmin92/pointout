class DashboardController < ApplicationController
  before_action :authenticate_forwarder!
  
  layout "backend"


  # reports
  def reports
    @reports = Report.all
  end

  def showreport
    @report = Report.find(params[:id])
  end

  def forwardreport
    puts "==================================================================================="
    redirect_to dashboard_reports_path
  end

  # Tipolologies

  def tipologies
    if current_forwarder.boss
      @tipologies = Tipology.where.not("id IN (?)", current_forwarder.group.tipologies.select(:id))
    end
  end

  def createoccupation
    if current_forwarder.boss
      Occupation.create(:group => current_forwarder.group, :tipology => Tipology.find(params[:id]))
    end
    redirect_to tipologies_path
  end

  def newtipology
    if current_forwarder.boss
      @tipology = Tipology.new
    end
  end

  def createtipology
    if current_forwarder.boss
    @tipology = Tipology.new(tipology_params)
    respond_to do |format|
      if @tipology.save
        Occupation.create(:group => current_forwarder.group, :tipology => @tipology)
        format.html { redirect_to dashboard_reports_path, notice: 'Report was successfully created.' }
      else
        format.html { render :newtipology }
      end
    end
    end
  end

  def occupations
    @occupations = current_forwarder.group.occupations
  end


  private

  def tipology_params
      params.require(:tipology).permit(:name, :description, :logo, :parent_id)
  end


end
