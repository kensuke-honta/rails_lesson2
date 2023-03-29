class ReservationsController < ApplicationController
  before_action :reservation_params, only: :confirm
    def index
        @rooms = current_user.rooms
        @reservations = current_user.reservations
    end

    def new
      @reservation = Reservation.new
      @room = Room.find(params[:room_id])
    end
    
    
    def confirm
      @reservation = Reservation.new(reservation_params)
      @room = Room.find(@reservation.room_id)
      @reservation.room = @room
      if @reservation.invalid?
      render :confirm
      end
    end
    
    def back
      @reservation = Reservation.new(reservation_params)
      render :new
    end
    
   
  
      

    def create
    @reservation = current_user.reservations.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])

    @reservation.room = @room
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end


     def show
     
     end
      

      
      private
      
      def reservation_params
        params.require(:reservation).permit(:check_in_date, :check_out_date, :num_of_guests, :user_id, :room_id)
      end
      
     
    

end
