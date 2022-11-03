class Resume < ApplicationRecord
    has_many :card,dependent: :destroy
    belongs_to :corp
    
end
