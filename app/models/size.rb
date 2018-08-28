class Size < ActiveRecord::Base
    has_many :shoes
    ransackable_attributes :size_name
end
