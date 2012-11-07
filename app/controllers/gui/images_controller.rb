class Gui::ImagesController < ApplicationController
  # GET /gui/images
  # GET /gui/images.json
  def index
    @gui_images = Gui::Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gui_images }
    end
  end

  # GET /gui/images/1
  # GET /gui/images/1.json
  def show
    @image = Gui::Image.find(params[:id])
    @panel = @image.panel
    @dialog = @image.dialog
    @images = @panel.images unless @panel.nil?
    @images = @dialog.images unless @dialog.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gui_image }
    end
  end

  # GET /gui/images/new
  # GET /gui/images/new.json
  def new
    @image = Gui::Image.new
    @panel_id = params[:panel_id]
    @dialog_id = params[:dialog_id]

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @gui_image }
    # end
  end

  # GET /gui/images/1/edit
  def edit
    @image = Gui::Image.find(params[:id])
    @panel = @image.panel
    @dialog = @image.dialog
    @view_key = Gui::ViewKey.new
    @view_keys = @image.view_keys
  end

  # POST /gui/images
  # POST /gui/images.json
  def create
    panel_id = params[:panel_id]
    dialog_id = params[:dialog_id]
    @image
    if ! panel_id.nil?
      @image = Gui::Panel.find(panel_id).images.build(params[:gui_image])
    elsif ! dialog_id.nil?
      @image = Gui::Dialog.find(dialog_id).images.build(params[:gui_image])      
    end

    if ! @image.nil? && @image.save(params[:image_file]["image_data"])
      flash[:success] = "Image uploaded!"
      redirect_to @image
    else
      flash[:error] = "Fail to upload the image."
      @title = "Create Image"
      render 'new'
    end
  end

  # PUT /gui/images/1
  # PUT /gui/images/1.json
  def update
    @gui_image = Gui::Image.find(params[:id])

    respond_to do |format|
      if @gui_image.update_attributes(params[:gui_image])
        format.html { redirect_to @gui_image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gui_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gui/images/1
  # DELETE /gui/images/1.json
  def destroy
    @image = Gui::Image.find(params[:id])
    @image.destroy
    redirect_to gui_panels_path

    # respond_to do |format|
    #   format.html { redirect_to gui_images_url }
    #   format.json { head :no_content }
    # end
  end
end
