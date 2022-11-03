module QuesHelper
    def selectQue(ques)
        queSection={}
        ques.each do |que|
            queSection.store(que.title,que.id)
        end
        queSection
    end
end
