class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.first(15)
      #@votes_total = @galleries.votes_for
     #@votes_against_total = @galleries.votes_against
      #@galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
  @votes_total = @gallery.votes_for
  @votes_against_total = @gallery.votes_against

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  #def vote_for
    #@gallery = Gallery.find(params[:id])
    #current_user.vote_for(@gallery)

    #respond_to do |format|
      #format.js
      #format.html {redirect_to :back, notice: "Thanks for the vote!"}
    #end 
  #end

#def vote_for
    #begin
      #@gallery = Gallery.find(params[:id])
      #current_user.vote_for(@gallery)
      #redirect_to :back
      #flash[:success] = "You have voted successfully"
      #@votes_total = @gallery.votes_for
    #rescue ActiveRecord::RecordInvalid
        #redirect_to :back
        #flash[:error] = "You have already voted for this one"
    #end
  #end

def vote_for
    begin
      gallery = Gallery.find(params[:id])
      current_user.vote_for(gallery)
      @votes_total = gallery.votes_for

      respond_to do |format|
        format.js
        #below links changed due to ajax issue on vote btns
        format.html {redirect_to galleries_url, notice: "You have voted successfully!"}
      #format.html {redirect_to :back, notice: "You have voted successfully!"}
    end
     rescue ActiveRecord::RecordInvalid
      respond_to do |format|
          format.js
          format.html {redirect_to galleries_url, notice: "You have already voted for that Photo!"}
          #format.html {redirect_to :back, notice: "You have already voted for that Photo!"}
      end
    end
  end



 def vote_against
   begin
      gallery = Gallery.find(params[:id])
      current_user.vote_against(gallery)
      @votes_against_total = gallery.votes_against

      respond_to do |format|
        format.js
        #below links changed due to ajax issue on vote btns, otherwise was going back a page on any vote click
        #format.html {redirect_to galleries_url, notice: "You have voted successfully!"}
      format.html {redirect_to galleries_url, notice: "You have voted successfully!"}
    end
     rescue ActiveRecord::RecordInvalid
      respond_to do |format|
          format.js
          #then changed them back again after ajax failing on submit btn for the gem!
          #format.html {redirect_to galleries_url, notice: "You have already voted for that Photo!"}
          format.html {redirect_to galleries_url, notice: "You have already voted for that Photo!"}
      end
    end
  end


   def positive_vote_count
    @gallery = Gallery.find(params[:id])
   @gallery.positive_vote_count

    respond_to do |format|
      format.js
      format.html {redirect_to :back}
    end
  end

   def negative_vote_count
    @gallery = Gallery.find(params[:id])
    current_user.negative_vote_count(@gallery)
    respond_to do |format|
      format.js
    end
  end
  

end
