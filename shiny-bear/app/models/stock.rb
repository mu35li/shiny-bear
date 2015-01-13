class Stock < ActiveRecord::Base
    validates :item, :count, presence: true
end
