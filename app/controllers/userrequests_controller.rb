class UserrequestsController < ApplicationController
  before_action :set_userrequest, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ index edit new update destroy show ]

  # GET /userrequests or /userrequests.json
  def index
    @userrequests = Userrequest.all
  end

  # GET /userrequests/1 or /userrequests/1.json
  def show
    @userrequest = Userrequest.find(params[:id])
  end

  # GET /userrequests/new
  def new
    @userrequest = Userrequest.new
  end

  # GET /userrequests/1/edit
  def edit
  end

  def news_response
    @userrequest = Userrequest.find(params[:id]).update(status: "approved")
    flash[:notice] = "You approved this news request."
  end

  # POST /userrequests or /userrequests.json
  def create
    @userrequest = Userrequest.new(userrequest_params.merge(user_id: current_user.id, admin: User.where(role: "admin").order("RANDOM()").limit(1).ids[0]))

    respond_to do |format|
      if @userrequest.save
        UserrequestsMailer.with(userrequest: @userrequest).admin_mail.deliver_later
        UserrequestsMailer.with(userrequest: @userrequest).user_email.deliver_later
        format.html { redirect_to @userrequest, notice: "Userrequest was successfully created." }
        format.json { render :show, status: :created, location: @userrequest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userrequests/1 or /userrequests/1.json
  def update
    respond_to do |format|
      if @userrequest.update(userrequest_params)
        format.html { redirect_to @userrequest, notice: "Userrequest was successfully updated." }
        format.json { render :show, status: :ok, location: @userrequest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userrequest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userrequests/1 or /userrequests/1.json
  def destroy
    @userrequest.destroy
    respond_to do |format|
      format.html { redirect_to userrequests_url, notice: "Userrequest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userrequest
      @userrequest = Userrequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userrequest_params
      params.require(:userrequest).permit(:news, :purpose, current_user.id, :admin)
    end
end
