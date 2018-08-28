class Shoe < ActiveRecord::Base
   
    belongs_to :size
    
    mount_uploader :picture, ImageUploader
end
