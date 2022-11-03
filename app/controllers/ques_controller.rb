class QuesController < ApplicationController
    def index
        @ques = Que.all
    end
    
    def new
        @que = Que.new
    end
    
    def create
        @que = Que.create(que_params)
        redirect_to corps_path
    end

    private
    def que_params
          params.require(:que).permit(:title)
    end
end
