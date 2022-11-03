class CorpsController < ApplicationController
    def index
        @corps = Corp.all
    end

    def new
        @corp = Corp.new
    end
    
    def create
        @corp = Corp.create(corp_params)
        redirect_to corps_path
    end
    
    private
    def corp_params
          params.require(:corp).permit(:name)
    end
    
end