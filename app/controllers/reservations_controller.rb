class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authenticate_for_specific_path
  @reservations = Reservation.all
  # GET /reservations or /reservations.json
  def index
    @pagy, @reservations = pagy(Reservation.all)
  end
  # def check_duplicate_date
  #   res_date = params[:date]

  #   if Reservation.exists?(res_date: res_date)
  #     # Duplicate reservation found
  #     flash[:notice] = "Duplicate reservation found for date: #{res_date}"
  #     redirect_to reservation_url(@reservation)
  #   else
  #     # No duplicate found, proceed with saving
  #     # ...
  #   end
  # end
  def authenticate_for_specific_path
    if request.path == reservations_path  # Replace with your desired path
      authenticate_user!
    end
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    @reservations = Reservation.all

  end


  # GET /reservations/new
  def new
    @reservations = Reservation.all
    @reservation = Reservation.new
    if current_user.email.end_with?('@admin.com')
      admin_pending_path
     else

     end
  end



  # GET /reservations/1/edit
  def edit
    @reservations = Reservation.all
    if current_user.email.end_with?('@admin.com')
      admin_pending_path
     else
     end
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

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

    respond_to do |format|
      if @reservation.update(reservation_params)
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

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }


    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
      if current_user.email.end_with?('@admin.com')
        admin_pending_path
       else

       end
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      if current_user.email.end_with?('@admin.com')
        admin_pending_path
       else

       end
      params.require(:reservation).permit(:res_name, :res_type, :contact_num, :res_date, :res_time, :sched_days, :avr, :user_id, :user_email)
    end
end

