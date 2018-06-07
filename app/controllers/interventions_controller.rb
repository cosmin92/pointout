class InterventionsController < ApplicationController
  before_action :authenticate_signaler!

  # create /post
  def create
    @report = Report.find(params[:report_id])
    intervention = Intervention.where("report_id = ? AND signaler_id = ?", @report.id, current_signaler.id).first

    if intervention != nil
      if intervention_params[:intervention_type] == "Immediate"
        intervention.intervention_type = "Immediate"
        intervention.save
      elsif intervention_params[:intervention_type] == "Ordinary"
        intervention.intervention_type = "Ordinary"
        intervention.save
      end
    else
      if intervention_params[:intervention_type] == "Immediate"
        Intervention.create(:report => @report, :signaler => current_signaler, :intervention_type => "Immediate")
      elsif intervention_params[:intervention_type] == "Ordinary"
        Intervention.create(:report => @report, :signaler => current_signaler, :intervention_type => "Ordinary")
      end
    end
    redirect_to @report
  end

  private

  def intervention_params
    params.require(:intervention).permit(:intervention_type)
  end
end