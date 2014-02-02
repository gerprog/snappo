class ChallengersController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  # GET /challengers
  # GET /challengers.json
  def index
       @challengers = Challenger.search(params[:search_query])
    #@challengers = Challenger.all
@cart = current_cart

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @challengers }
    # end
  end

  # GET /challengers/1
  # GET /challengers/1.json
  def show
    @challenger = Challenger.find(params[:id])
@cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @challenger }
    end
  end

  # GET /challengers/new
  # GET /challengers/new.json
  def new
    @challenger = Challenger.new
@cart = current_cart

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenger }
    end
  end

  # GET /challengers/1/edit
  def edit
    @challenger = Challenger.find(params[:id])
    @cart = current_cart
  end

  # POST /challengers
  # POST /challengers.json
  def create
    @challenger = current_user.challengers.new(params[:challenger])
@cart = current_cart

    respond_to do |format|
      if @challenger.save
        format.html { redirect_to @challenger, notice: 'Challenger was successfully created.' }
        format.json { render json: @challenger, status: :created, location: @challenger }
      else
        format.html { render action: "new" }
        format.json { render json: @challenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /challengers/1
  # PUT /challengers/1.json
  def update
    @challenger = Challenger.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      if @challenger.update_attributes(params[:challenger])
        format.html { redirect_to @challenger, notice: 'Challenger was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challengers/1
  # DELETE /challengers/1.json
  def destroy
    @challenger = Challenger.find(params[:id])
    @challenger.destroy
    @cart = current_cart

    respond_to do |format|
      format.html { redirect_to challengers_url }
      format.json { head :no_content }
    end
  end

    def who_bought
    @challenger = Challenger.find(params[:id])
    respond_to do |format|
      format.atom
    end
  end
  
end
