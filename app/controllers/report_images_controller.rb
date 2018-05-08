class ReportImagesController < ApplicationController
  before_action :set_report

  def create
    add_more_images(images_params[:images]))
    flash[:error] = "Failed uploading images" unless @report.save
    redirect_to :back
  end


  private

  def set_report
    @report = Report.find(params[:report_id])
  end

  def add_more_images(new_images)
    images = @report.images # copy the old images 
    images += new_images # concat old images with new ones
    @report.images = images # assign back
  end

  def images_params
    params.require(:gallery).permit({images: []}) # allow nested params as array
  end
end