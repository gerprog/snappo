class Challenger < ActiveRecord::Base
	  has_many :line_items
    has_many :orders, through: :line_items

	    before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :caption, :colour, :homage_url, :location, :theme, :timescale, :title
	validates :title, :caption, :colour, :homage_url, :location, :theme, :timescale, presence: true
	validates :title, uniqueness: true
	 validates :homage_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  belongs_to :user


 def self.search(search_query)
     if search_query
       find(:all, :conditions => ['title LIKE ? OR caption LIKE ? OR colour LIKE ?
        OR location LIKE ? OR theme LIKE ? OR timescale LIKE ? OR homage_url LIKE ?', "%#{search_query}%",
         "%#{search_query}%", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%"])
     else
       find(:all)
     end
   end



  
private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end

