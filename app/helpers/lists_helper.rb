module ListsHelper
    def selectEs(resumes)
        es={}
        resumes.each do |resume|
            es.store(resume.title,resume.id)
        end
        es
    end
    def vali_id(id)
        id=~/^[0-9]+$/ ? id : -1
    end

end