class LightboxesController < ApplicationController
  # GET /lightboxes
  # GET /lightboxes.json
  def index
    @lightboxes = Lightbox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lightboxes }
    end
  end

  # GET /lightboxes/1
  # GET /lightboxes/1.json
  def show
    @lightbox = Lightbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lightbox }
    end
  end

  # GET /lightboxes/new
  # GET /lightboxes/new.json
  def new
    @lightbox = Lightbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lightbox }
    end
  end

  # GET /lightboxes/1/edit
  def edit
    @lightbox = Lightbox.find(params[:id])
  end

  # POST /lightboxes
  # POST /lightboxes.json
  def create
    @lightbox = Lightbox.new(params[:lightbox])

    respond_to do |format|
      if @lightbox.save
        format.html { redirect_to @lightbox, notice: 'Lightbox was successfully created.' }
        format.json { render json: @lightbox, status: :created, location: @lightbox }
      else
        format.html { render action: "new" }
        format.json { render json: @lightbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lightboxes/1
  # PUT /lightboxes/1.json
  def update
    @lightbox = Lightbox.find(params[:id])

    respond_to do |format|
      if @lightbox.update_attributes(params[:lightbox])
        format.html { redirect_to @lightbox, notice: 'Lightbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lightbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lightboxes/1
  # DELETE /lightboxes/1.json
  def destroy
    @lightbox = Lightbox.find(params[:id])
    @lightbox.destroy

    respond_to do |format|
      format.html { redirect_to lightboxes_url }
      format.json { head :no_content }
    end
  end
end
