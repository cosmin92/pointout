class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_forwarder!
  
  layout "backend"
  # GET /notices
  # GET /notices.json
  def index
    @notices = current_forwarder.group.notices
  end

  # GET /notices/new
  def new
    if current_forwarder.boss
      @notice = Notice.new
    end
  end

  # GET /notices/1/edit
  def edit
    if !current_forwarder.boss
      redirect_to notices_path
    end
  end

  # POST /notices
  # POST /notices.json
  def create
    if current_forwarder.boss
      @notice = Notice.new(notice_params)
      @notice.forwarder = current_forwarder
      @notice.group = current_forwarder.group

      respond_to do |format|
        if @notice.save
          format.html { redirect_to notices_path, notice: 'Notice was successfully created.' }
          format.json { render :show, status: :created, location: @notice }
        else
          format.html { render :new }
          format.json { render json: @notice.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    if current_forwarder.boss
      respond_to do |format|
        if @notice.update(notice_params)
          format.html { redirect_to notices_path, notice: 'Notice was successfully updated.' }
          format.json { render :show, status: :ok, location: @notice }
        else
          format.html { render :edit }
          format.json { render json: @notice.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    if current_forwarder.boss
      @notice.destroy
      respond_to do |format|
        format.html { redirect_to notices_url, notice: 'Notice was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:title, :content, :posting_date, :expiration_date, :notice_type)
    end
end
