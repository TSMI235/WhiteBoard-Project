class WhiteboardsController < ApplicationController

    before_action :authenticate_user!

    def index
        @whiteboards = Whiteboard.all
        @userSplit = (current_user.email).split("@")
        @username = @userSplit[0];
    end
  
    def show
        @whiteboard = Whiteboard.friendly.find(params[:id])
        @title = @whiteboard.title
        @width = @whiteboard.canvas_width
        @height = @whiteboard.canvas_height
    end
  
    def new 
      @whiteboard = Whiteboard.new
    end

    def create
        @whiteboard = Whiteboard.new(whiteboard_params)
        @whiteboard.creator_email = current_user.email
        if @whiteboard.save
            redirect_to controller: 'whiteboards', action: 'show', id: @whiteboard.hash_id
        else
            render :new
        end
    end

    def edit
        @whiteboard = Whiteboard.friendly.find(params[:id])
    end

    def update
        @whiteboard = Whiteboard.friendly.find(params[:id])
        if @whiteboard.update(whiteboard_params)
            redirect_to controller: 'whiteboards', action: 'show', id: @whiteboard.hash_id
        else
            render :edit
        end
    end

    def destroy
        @whiteboard = Whiteboard.friendly.find(params[:id])
        if Rails.application.assets.find_asset(@whiteboard.hash_id+'.png') != nil
            File.delete("#{Rails.root}/app/assets/images/#{@whiteboard.hash_id}.png")
        end 
        @whiteboard.destroy
        redirect_to controller: 'home', action: 'index'
    end

    def save
        @whiteboard = Whiteboard.friendly.find(params[:id])
    	File.open("#{Rails.root}/app/assets/images/#{@whiteboard.hash_id}.png", 'wb') do |f|
        f.write(params[:image].read)
        end
    end

    def showcable
        ActionCable.server.broadcast 'drawing',
        hash: params[:hash],
        x: params[:x],
        y: params[:y],
        x1: params[:x1],
        y2: params[:y2],
        color1: params[:color1],
        size1: params[:size1],
        highl: params[:highl]
        head :ok
    end
    
    private

    def whiteboard_params
        params.require(:whiteboard).permit(:title, :description, :canvas_height, :canvas_width)
    end
  
  end
  
