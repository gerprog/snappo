class Order < ActiveRecord::Base
  attr_accessible :email, :name, :avatar
  has_many :line_items, dependent: :destroy

  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" },
   :url => "/system/:attachment/:style/:basename.:extension",  
  :path => ":rails_root/public/system/:attachment/:style/:basename.:extension"  

# below are commented out so could have avatar upload within challenge
#below validates from the paperclip github may not be necessary
#validates :avatar, :attachment_presence => true
#validates_with AttachmentPresenceValidator, :attributes => :avatar

validates_attachment :avatar, #:presence => true,
  #:content_type => { :content_type => "image/jpg" },
  :size => { :in => 0..2000.kilobytes }

    #removing validation for email as the requirment is confusing if already logged in
    #validates :name, :email, presence: true
    validates :name, presence: true
    
     def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
