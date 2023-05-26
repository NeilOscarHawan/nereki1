class AvrsController < ActionController::Base
    before_action :set_avr, only: %i[ show edit update destroy ]
    layout 'admin'
      def index
        @avrs = Avr.all
         end

         def show
         end
         def new
            @avr = Avr.new
         end
         def edit
         end
        def create
            @avr = Avr.new(avr_params)
            respond_to do |format|
              if @avr.save
                format.html { redirect_to avr_url(@avr), notice: "New AVR added." }
                format.json { render :show, status: :created, location: @avr}
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @avr.errors, status: :unprocessable_entity }
              end
        
            end
          end
        def update
            respond_to do |format|
              if @avr.update(avr_params)
                format.html { redirect_to avr_url(@avr), notice: "AVR updated." }
                format.json { render :show, status: :ok, location: @avr }
              else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @avr.errors, status: :unprocessable_entity }
              end
            end
          end

          def destroy
            @avr.destroy
        
            respond_to do |format|
              format.html { redirect_to avrs_url, notice: "AVR was successfully destroyed." }
              format.json { head :no_content }
        
        
            end
          end
private
          # Use callbacks to share common setup or constraints between actions.
          def set_avr
            @avr = Avr.find(params[:id])
          end
      
          # Only allow a list of trusted parameters through.
          def avr_params
            @avrs = Avr.all
            if current_user.email.end_with?('@admin.com') || current_user.email.end_with?('@staff.com')
              admin_pending_path
             else
              root_path
             end
            params.require(:avr).permit(:avr_name, :avr_status, :is_for_students, :avr_desc, :avr_loc)
          end
      end
      
  