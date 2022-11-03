module CorpsHelper
    def selectCorp(corps)
        corpSection={}
        corps.each do |corp|
            corpSection.store(corp.name,corp.id)
        end
        corpSection
    end
    def findCorp(cid)
        if cid != nil
            @corp = Corp.find_by(id: cid)
            @corp.name

        else
            ''
        end
    end
end
