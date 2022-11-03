class CardsController < ApplicationController
    def index
        @cards = Card.where(resume_id: params[:resume_id])
        @resume = Resume.find_by(id: params[:resume_id])
        @corp = Corp.find_by(id: params[:corp_id])
    end
    def new
        @card = Card.new
        @resume = Resume.find_by(id: params[:resume_id])
        @que = Que.all
    end
      
    def create
        @card = Card.create(card_params)
        redirect_to corp_resume_cards_path
    end

    def edit
        @card = Card.find(params[:id])
        @que = Que.new
    end
    
    def update
        @card = Card.find(params[:id])
        @card.update(card_params)
        redirect_to corp_resume_cards_path
    end


    private
    def card_params
      params.require(:card).permit(:que,:content,:resume_id,:que_type)
    end
end
