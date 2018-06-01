class ObservationsController < ApplicationController
    before_action :authenticate_signaler!
    before_action :set_report

    def create
        @observation = @report.observations.build(observations_params)
        @observation.signaler_id = current_signaler.id

        if @observation.save
          flash[:success] = "Your observation was successfully saved"
          redirect_to @report
        else
          flash[:alert] = "Your observation was not saved"
          redirect_to @report
        end
    end

    def destroy
      @observation = @report.observations.find(params[:id])
      @observation.destroy

      flash[:success] = "Observation deleted"
      redirect_to @report
    end


    private

    def observations_params
      params.require(:observation).permit(:content, :tag_list, {images: []})
    end

    def set_report
      @report = Report.find(params[:report_id])
    end

end
