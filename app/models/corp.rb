class Corp < ApplicationRecord
    has_many :resume,dependent: :destroy
    def cards
        resumes = Resume.where(corp_id: id)
        resumes_id= []
        resumes.each do |resume|
            resumes_id.push(resume.id)
        end
        Card.where(resume_id: resumes_id)

        # resumes = Resume.where(corp_id: corp_id)
        # corp_cards= []
        # resumes.each do |resume|
        #     @cards = Card.where(resume_id: resume.id)
        #     corp_cards.push(@cards)
        # end
        # binding.pry
        # corp_cards
    end
end
