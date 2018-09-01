class Type < ActiveRecord::Base
    has_many :shoes
    ransackable_attributes :type_name
end
