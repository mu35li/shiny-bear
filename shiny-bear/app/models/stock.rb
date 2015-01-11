class Stock < ActiveRecord::Base
    validates :item, presence: true
end
