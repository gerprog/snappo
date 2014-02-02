class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_challenger(challenger_id)
    current_item = line_items.find_by_challenger_id(challenger_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(challenger_id: challenger_id)
    end
    current_item
  end
end
