class TipologiesController < ApplicationController
  before_action :set_tipology, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_forwarder!
  
  layout "backend"
  # GET /tipologies
  # GET /tipologies.json
  def index
    if current_forwarder.boss
      @tipologies = Tipology.where.not("id IN (?)", current_forwarder.group.tipologies.select(:id))
    end
  end

  # GET /tipologies/new
  def new
    @tipology = Tipology.new
  end

  # GET /tipologies/1/edit
  def edit
  end

  # POST /tipologies
  # POST /tipologies.json
  def create
    @tipology = Tipology.new(tipology_params)
    @tipology.forwarder = current_forwarder

    respond_to do |format|
      if @tipology.save
        format.html { redirect_to tipologies_url, notice: 'Tipology was successfully created.' }
        format.json { render :show, status: :created, location: @tipology }
      else
        format.html { render :new }
        format.json { render json: @tipology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipologies/1
  # PATCH/PUT /tipologies/1.json
  def update
    respond_to do |format|
      if @tipology.update(tipology_params)
        format.html { redirect_to tipologies_url, notice: 'Tipology was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipology }
      else
        format.html { render :edit }
        format.json { render json: @tipology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipologies/1
  # DELETE /tipologies/1.json
  def destroy
    @tipology.destroy
    respond_to do |format|
      format.html { redirect_to tipologies_url, notice: 'Tipologies was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipology
      @tipology = Tipology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipology_params
      params.require(:tipology).permit(:name, :description, :logo)
    end
end
