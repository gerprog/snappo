class FlatboxesController < ApplicationController
  # GET /flatboxes
  # GET /flatboxes.json
  def index
    @flatboxes = Flatbox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flatboxes }
    end
  end

  # GET /flatboxes/1
  # GET /flatboxes/1.json
  def show
    @flatbox = Flatbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flatbox }
    end
  end

  # GET /flatboxes/new
  # GET /flatboxes/new.json
  def new
    @flatbox = Flatbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flatbox }
    end
  end

  # GET /flatboxes/1/edit
  def edit
    @flatbox = Flatbox.find(params[:id])
  end

  # POST /flatboxes
  # POST /flatboxes.json
  def create
    @flatbox = Flatbox.new(params[:flatbox])

    respond_to do |format|
      if @flatbox.save
        format.html { redirect_to @flatbox, notice: 'Flatbox was successfully created.' }
        format.json { render json: @flatbox, status: :created, location: @flatbox }
      else
        format.html { render action: "new" }
        format.json { render json: @flatbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flatboxes/1
  # PUT /flatboxes/1.json
  def update
    @flatbox = Flatbox.find(params[:id])

    respond_to do |format|
      if @flatbox.update_attributes(params[:flatbox])
        format.html { redirect_to @flatbox, notice: 'Flatbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flatbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flatboxes/1
  # DELETE /flatboxes/1.json
  def destroy
    @flatbox = Flatbox.find(params[:id])
    @flatbox.destroy

    respond_to do |format|
      format.html { redirect_to flatboxes_url }
      format.json { head :no_content }
    end
  end
end
