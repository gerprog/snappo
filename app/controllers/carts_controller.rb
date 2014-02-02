class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
 @challengers = Challenger.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }

         @carts = Cart.paginate page: params[:page], order: 'created_at desc',
      per_page: 10
    end
  end

  # GET /carts/1
  # GET /carts/1.json
 def show
    begin
      @cart = Cart.find(params[:id])
      @challengers = Challenger.all
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to challenges_url, notice: 'Take a Challenge first!'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new
 @challengers = Challenger.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])
 @challengers = Challenger.all
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])
 @challengers = Challenger.all
    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
     @challengers = Challenger.all
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      #format.html { redirect_to challenges_url }
        format.html { redirect_to :controller => "challenges", :action => 'make_one',
                                notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end
end
