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
        redirect_to whiteboards_path
    end
    
    private

    def whiteboard_params
        params.require(:whiteboard).permit(:title, :description)
    end
  
  end
  
