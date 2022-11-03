class ResumesController < ApplicationController
    def index
        @resumes = Resume.all
    end
    def new
        @resume = Resume.new
        @corp = Corp.find_by(id: params[:corp_id])
    end
      
    def create
        @resume = Resume.new(resume_params)
        if @resume.save
            redirect_to corps_path
        else
            render action: :new
        end
    end

    private
    def resume_params
      params.require(:resume).permit(:title,:corp_id)
    end
end
