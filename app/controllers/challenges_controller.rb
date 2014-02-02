class ChallengesController < ApplicationController

   def index
    #@order = Order.find(params[:id])
    @cart = current_cart
    @orders = Order.all(:order => "created_at", :limit => 12)
 
     @challengers = Challenger.search(params[:search_query])

	#@line_items = LineItem.all
  #@line_item = LineItem.find(params[:id])
  end

def make_one
    @challengers = Challenger.all(:order => 'RANDOM()', :limit => 1)
    @cart = current_cart
  end

   def thanks
    @challengers = Challenger.all
    @cart = current_cart
  end


     def thanks_for_photo
    @challengers = Challenger.all
    @cart = current_cart
  end

end
