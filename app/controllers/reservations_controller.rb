class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authenticate_for_specific_path

  @reservations = Reservation.all
  @users = User.all 
  # GET /reservations or /reservations.json
  def index
    @pagy, @reservations = pagy(Reservation.all, items: 10)
  end
 
  def authenticate_for_specific_path
    if request.path == reservations_path  # Replace with your desired path
      authenticate_user!
    end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    @reservations = Reservation.all
    @users = User.all
  end


  # GET /reservations/new
  def new
    @reservations = Reservation.all
    @reservation = Reservation.new
    @users = User.all
    if current_user.email.end_with?('@admin.com')
      admin_pending_path
    else
     root_path
  end
end


  # GET /reservations/1/edit
  def edit
    @reservations = Reservation.all
    @users = User.all
    if current_user.email.end_with?('@admin.com')
      admin_pending_path
     else
      root_path
     end
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @users = User.all
    respond_to do |format|
      if @reservation.save

        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end

    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
<<<<<<< HEAD
    @users = User.all
=======

>>>>>>> fa356815bdd0a8b3c56d74d37a4921c65ac5d7dc
    respond_to do |format|
      if @reservation.update(reservation_params)
        ReservationMailer.reservation_approved.deliver_later
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
<<<<<<< HEAD
    @users = User.all
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }     
=======

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }


>>>>>>> fa356815bdd0a8b3c56d74d37a4921c65ac5d7dc
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @users = User.all
      @reservation = Reservation.find(params[:id])
      
      if current_user.email.end_with?('@admin.com')
        admin_pending_path
       else
        root_path
       end
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      @users = User.all
      if current_user.email.end_with?('@admin.com')
        admin_pending_path
       else
        root_path
       end
      params.require(:reservation).permit(:res_name, :res_type, :contact_num, :res_date, :res_time, :sched_days, :avr, :user_id, :user_email, :slots, :res_status, :current_user)
    end
end

