class WordupsController < ApplicationController
  # GET /wordups
  # GET /wordups.json
  def index
    @wordups = Wordup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wordups }
    end
  end


  def ischecked
    @input1 = params[:search_string]
    @result = Wordup.validate_me(@input1.to_s)
  end



  # GET /wordups/1
  # GET /wordups/1.json
  def show
    @wordup = Wordup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wordup }
    end
  end

  # GET /wordups/new
  # GET /wordups/new.json
  def new
    @wordup = Wordup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wordup }
    end
  end

  # GET /wordups/1/edit
  def edit
    @wordup = Wordup.find(params[:id])
  end

  # POST /wordups
  # POST /wordups.json
  def create
    @wordup = Wordup.new(params[:wordup])

    respond_to do |format|
      if @wordup.save
        format.html { redirect_to @wordup, notice: 'Wordup was successfully created.' }
        format.json { render json: @wordup, status: :created, location: @wordup }
      else
        format.html { render action: "new" }
        format.json { render json: @wordup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wordups/1
  # PUT /wordups/1.json
  def update
    @wordup = Wordup.find(params[:id])

    respond_to do |format|
      if @wordup.update_attributes(params[:wordup])
        format.html { redirect_to @wordup, notice: 'Wordup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wordup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wordups/1
  # DELETE /wordups/1.json
  def destroy
    @wordup = Wordup.find(params[:id])
    @wordup.destroy

    respond_to do |format|
      format.html { redirect_to wordups_url }
      format.json { head :no_content }
    end
  end
end
