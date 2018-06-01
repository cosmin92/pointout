class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_signaler!, only: [:new, :create, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    if params.has_key?(:search)
      search = params.require(:search).permit(:tipology_id, :report_type, :creation_date, :object,:address, :longitude, :latitude, :radius, :unit)

      if search.has_key?(:tipology_id) && search[:tipology_id] != ""

        @reports = Tipology.find(search[:tipology_id]).reports
      end

      if search.has_key?(:report_type) && search[:report_type] != ""
        @reports = @reports.where("report_type = ?", search[:report_type])
      end

      if search.has_key?(:creation_date) && search[:creation_date] != ""
          if search[:creation_date] == "asc"
            @reports = @reports.ordered_by_creation_date_asc
          end

          if search[:creation_date] == "desc"
            @reports = @reports.ordered_by_creation_date_desc
          end
      end

      if search.has_key?(:object) && search[:object] != ""
          if search[:object] == "asc"
            @reports = @reports.ordered_by_object_asc
          end

          if search[:object] == "desc"
            @reports = @reports.ordered_by_object_desc
          end
      end

      if search.has_key?(:address) && search.has_key?(:longitude) && search.has_key?(:latitude) && search.has_key?(:radius) && search.has_key?(:unit) && search[:address] != "" && search[:longitude] != "" && search[:latitude] != "" && search[:radius] != "" && search[:unit] != ""
        @reports = @reports.nearby({:latitude => search[:latitude].to_f, :longitude => search[:longitude].to_f}, converter(search[:radius].to_i, search[:unit]))
      end
    elsif params[:tag]
      @reports = Report.tagged_with(params[:tag])
    else
      @reports = Report.all
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @new_obervation = Observation.new
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create

    @report = Report.new(report_params)
    @report.signaler = current_signaler

    respond_to do |format|
      if @report.save
        if params[:intervention_type] != ""
          if params[:intervention_type] == "Ordinary"
            Intervention.create(:report => @report, :signaler => current_signaler, :intervention_type => "Ordinary")
          elsif params[:intervention_type] == "Immediate"
            Intervention.create(:report => @report, :signaler => current_signaler, :intervention_type => "Immediate")
          end
        end
        #// TODO:cacas
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)

        if params[:intervention_type] != ""
            inter = Intervention.where("report_id = ? AND signaler_id = ?", @report.id, @report.signaler.id ).first

            if inter.nil?
              Intervention.create(:report => @report, :signaler => current_signaler, :intervention_type => params[:intervention_type])
            else
              inter.intervention_type = params[:intervention_type]
              inter.save
            end
        end

        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:object, :description, :address, :longitude, :latitude, :report_type, :intervention_type, :tipology_id, :tag_list, {images: []} )
  end

  def converter(radius, unit)
    if unit == "km"
      return radius *1000
    elsif unit == "ft"
      return radius/3.2808
    elsif unit == "yd"
      return radius/1.0936
    elsif unit == "mi"
      return radius/0.00062137
    else
      return radius
    end
  end
  
end
