class RoomsController < ApplicationController
    
     def index
         @rooms = current_user.rooms
     end

     def show
       @user = current_user
       @room = Room.find(params[:id])
     end

     def new
         @room = Room.new
     end
   
     def create
         @room = Room.new(params.require(:room).permit(:name, :introduction,  :price, :address, :image))
         @room.user_id = current_user.id

         if @room.save
           redirect_to rooms_path
         else
           render :new
         end
     end

     def search
       @rooms = Room.all
       if params[:address].present?
         @rooms = @rooms.search_by_address(params[:address])
       end
       if params[:keyword].present?

         @rooms = @rooms.where("introduction LIKE ? OR name LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
       end
       @rooms_count = @rooms.count
      end

     
     def edit
     end    
     def update
     end    
     def destroy
     end    
    end
