class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_forwarder!

  layout "backend"
  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.all
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)
    @agency.forwarder = current_forwarder

    respond_to do |format|
      if @agency.save

        if params.has_key?(:contact) && params[:contact].has_key?(:address_book_id) && params[:contact][:address_book_id] != ""
          Contact.create(:address_book => AddressBook.find(params[:contact][:address_book_id]), :agency => @agency)
        end
        format.html {redirect_to @agency, notice: 'Agency was successfully created.'}
        format.json {render :show, status: :created, location: @agency}
      else
        format.html {render :new}
        format.json {render json: @agency.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    if current_forwarder.id == @agency.forwarder.id
      respond_to do |format|
        if @agency.update(agency_params)
          format.html {redirect_to @agency, notice: 'Agency was successfully updated.'}
          format.json {render :show, status: :ok, location: @agency}
        else
          format.html {render :edit}
          format.json {render json: @agency.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    if current_forwarder.id == @agency.forwarder.id
      @agency.destroy
      respond_to do |format|
        format.html {redirect_to agencies_url, notice: 'Agency was successfully destroyed.'}
        format.json {head :no_content}
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agency
    @agency = Agency.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def agency_params
    params.require(:agency).permit(:name, :phone, :email, :fax, :street, :number, :city, :zip_code, :note, :web_site_url)
  end
end
