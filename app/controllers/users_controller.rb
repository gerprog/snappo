class UsersController < ApplicationController
#below is commented out as was stopping anyone but admin logging in and seeing the correct pages!
#before_filter :is_admin?

# def index from W's tut
def index

@users = User.find(:all)
@cart = current_cart

      @users = User.paginate page: params[:page], order: 'created_at desc',
      per_page: 10
end

# def new from W's tut
def new
	@user = User.new
	@cart = current_cart
end


  def welcome
    @challengers = Challenger.all(:order => 'RANDOM()', :limit => 4)
    #@challengers = Challenger.all
    @cart = current_cart

    #@orders = Order.paginate page: params[:page], order: ' created_at desc',
        #per_page: 3

    @history = Order.paginate(:per_page => 3,
                              :page => params[:page],
                              :order => 'created_at DESC').where(user_id:current_user[:id])

    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end



#def edit added from agile
  def edit
    @user = User.find(params[:id])
    @challengers = Challenger.where(wanted: 'yes')
    @cart = current_cart
  end

  #def show added from agile
  def show
    #@challengers = Challenger.all(:order => 'RANDOM()', :limit => 4)
    @challengers = Challenger.all
    @cart = current_cart

    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid user #{params[:id]}"
      redirect_to :controller => "challenges", :action => 'index', notice: 'Invalid action'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  def create
    @user = User.new(params[:user])
    @cart = current_cart
   # @challengers = Challenger.all
    @challengers = Challenger.all(:order => 'RANDOM()', :limit => 4)

    if @user.save
      redirect_to login_path, :notice => 'User creation successful!'
    else
      render :action => 'new'
    end
  end


# def create from W's tut
#def create
	#@user = User.new(params[:user])
	#@cart = current_cart
	#if @user.save
		#redirect_to challengers_path, :notice => 'User creation successful!'
	#else
		#render :action => 'new'
	#end
#end


def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Details were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


end
