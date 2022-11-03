class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @corps = Corp.all
    end
    
    def create
        @event = Event.create(event_params)
        redirect_to lists_path
    end

    private
    def event_params
          params.require(:event).permit(:title,:content,:start_time,:corp_id)
    end
end
