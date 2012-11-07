class Gui::ViewKeysController < ApplicationController
  # GET /gui/view_keys
  # GET /gui/view_keys.json
  def index
    @gui_view_keys = Gui::ViewKey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gui_view_keys }
    end
  end

  # GET /gui/view_keys/1
  # GET /gui/view_keys/1.json
  def show
    @view_key = Gui::ViewKey.find(params[:id])
    @image = @view_key.image

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @gui_view_key }
    # end
  end

  # GET /gui/view_keys/new
  # GET /gui/view_keys/new.json
  def new
    @view_key = Gui::ViewKey.new(:x=>0, :y=>0, :width=>0, :height=>0)
    @image = Gui::Image.find(params[:image_id])
    @other_view_keys = Gui::ViewKey.select([:id, :name]).where(:image_id => 0)

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @gui_view_key }
    # end
  end

  # GET /gui/view_keys/1/edit
  def edit
    @view_key = Gui::ViewKey.find(params[:id])
    @image = @view_key.image
  end

  # POST /gui/view_keys
  # POST /gui/view_keys.json
  def create
    @image = Gui::Image.find(params[:image_id])

    if params.has_key?(:gui_view_key)
      view_key = @image.view_keys.build(params[:gui_view_key])
      if view_key.save
        flash[:success] = "ViewKey created!"
      else
        flash[:error] = "Fail to create the ViewKey."
      end
    elsif params.has_key?(:other_view_key)
      params[:other_view_key].each_key do |id|
        other_view_key = Gui::ViewKey.find(id)
        if other_view_key.update_attribute(:image_id, @image.id)
          flash[:success] = "ViewKeys updated!"
        else
          flash[:error] = "Fail to update the ViewKey(#{other_view_key.name})."
          break
        end
      end
    end
    redirect_to edit_gui_image_path(@image)

    # respond_to do |format|
    #   if @gui_view_key.save
    #     format.html { redirect_to @gui_view_key, notice: 'View key was successfully created.' }
    #     format.json { render json: @gui_view_key, status: :created, location: @gui_view_key }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @gui_view_key.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /gui/view_keys/1
  # PUT /gui/view_keys/1.json
  def update
    @view_key = Gui::ViewKey.find(params[:id])
    @image = @view_key.image

    if @view_key.update_attributes(params[:gui_view_key])
      flash[:success] = "ViewKey updated!"
      redirect_to edit_gui_image_path(@image)
    else
      flash[:error] = "Fail to update the ViewKey."
      @title = "Update Image"
      redirect_to edit_gui_image_path(@image)
    end

    # respond_to do |format|
    #   if @gui_view_key.update_attributes(params[:gui_view_key])
    #     format.html { redirect_to @gui_view_key, notice: 'View key was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @gui_view_key.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /gui/view_keys/1
  # DELETE /gui/view_keys/1.json
  def destroy
    @view_key = Gui::ViewKey.find(params[:id])
    @image = @view_key.image
    @view_key.destroy

    redirect_to edit_gui_image_path(@image)

    # respond_to do |format|
    #   format.html { redirect_to gui_view_keys_url }
    #   format.json { head :no_content }
    # end
  end
end
