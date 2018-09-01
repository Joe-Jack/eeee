class Shoe < ActiveRecord::Base
   
    belongs_to :size
    belongs_to :type
    belongs_to :brand
    mount_uploader :image, ImageUploader
end
