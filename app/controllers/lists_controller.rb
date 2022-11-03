class ListsController < ApplicationController
   include ListsHelper
    def index
        id = vali_id(params[:resume_id])
        q_id = vali_id(params[:que_type])
        if id == -1 && q_id ==-1
          @cards = Card.all
        elsif id != -1 && q_id == -1
          @cards = Card.where(resume_id: id)
        elsif id == -1 && q_id != -1
          @cards = Card.where(que_type: q_id)
        end
        @resumes = Resume.all
        @corps = Corp.all
        @events = Event.all
    end

    def list
      @resumes = Resume.where(corp_id: params[:corp_id])
      render json: {
        html: render_to_string(partial: 'list', locals: { resumes: @resumes}) 
      }
    end

    def formque
      @ques = Que.all
      render json: {
        html: render_to_string(partial: 'formque', locals: { ques: @ques}) 
      }
    end

    def formcorp
      @corps = Corp.all
      render json: {
        html: render_to_string(partial: 'formcorp', locals: { corps: @corps}) 
      }
    end

    def resumecards
      per=4
      r_id = vali_id(params[:resume_id])
      @cards = Card.where(resume_id: r_id).page(params[:page]).per(per).order(:id)
      total = (Card.where(resume_id: r_id).count/per.to_f).ceil
      # binding.pry
      render json: {
        html: render_to_string(partial: 'card', locals: { cards: @cards,page: params[:page],total: total}) 
      }
    end

    def quecards
      per=4
      q_id = vali_id(params[:que_id])
      @cards = Card.where(que_type: q_id).page(params[:page]).per(per).order(:id)
      total = (Card.where(que_type: q_id).count/per.to_f).ceil
      render json: {
        html: render_to_string(partial: 'card', locals: {cards: @cards,page: params[:page],total: total}) 
      }
    end

    def corpcards
      corp_id = vali_id(params[:corp_id])

      @corp = Corp.find_by(id: corp_id)
      render json: {
        html: render_to_string(partial: 'card', locals: { cards: @corp.cards}) 
      }
    end
    
    private
    def card_params
      params.require(:card).permit(:que,:content,:resume_id)
    end
end
