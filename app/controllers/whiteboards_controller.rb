class WhiteboardsController < ApplicationController

    # Might need to change to index 
    def index
      @whiteboards = Whiteboard.all;
    end
  
    def show
        @title = Whiteboard.find(params[:id]).title
        @whiteboard = Whiteboard.find(params[:id])
    end
  
    def new 
      @whiteboard = Whiteboard.new
    end

    def create
        @whiteboard = Whiteboard.new(whiteboard_params)
        if @whiteboard.save
            redirect_to controller: 'whiteboards', action: 'show', id: @whiteboard.id
        else
            render :new
        end
    end

    def edit
        @whiteboard = Whiteboard.find(params[:id])
    end

    def update
        @whiteboard = Whiteboard.find(params[:id])
        if @whiteboard.update(whiteboard_params)
            redirect_to controller: 'whiteboards', action: 'show', id: @whiteboard.id, title: @whiteboard.title
        else
            render :edit
        end
    end

    def destroy
        @whiteboard = Whiteboard.find(params[:id])
        @whiteboard.destroy
        redirect_to controller: 'home', action: 'index'
    end

    def showcable
        ActionCable.server.broadcast 'drawing',
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
        params.require(:whiteboard).permit(:title, :description)
    end
  
  end
  
