class Gui::ViewKeyInfosController < ApplicationController
  # GET /gui/view_key_infos
  # GET /gui/view_key_infos.json
  def index
    @gui_view_key_infos = Gui::ViewKeyInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gui_view_key_infos }
    end
  end

  # GET /gui/view_key_infos/1
  # GET /gui/view_key_infos/1.json
  def show
    @gui_view_key_info = Gui::ViewKeyInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gui_view_key_info }
    end
  end

  # GET /gui/view_key_infos/new
  # GET /gui/view_key_infos/new.json
  def new
    @gui_view_key_info = Gui::ViewKeyInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gui_view_key_info }
    end
  end

  # GET /gui/view_key_infos/1/edit
  def edit
    @gui_view_key_info = Gui::ViewKeyInfo.find(params[:id])
  end

  # POST /gui/view_key_infos
  # POST /gui/view_key_infos.json
  def create
    @gui_view_key_info = Gui::ViewKeyInfo.new(params[:gui_view_key_info])

    respond_to do |format|
      if @gui_view_key_info.save
        format.html { redirect_to @gui_view_key_info, notice: 'View key info was successfully created.' }
        format.json { render json: @gui_view_key_info, status: :created, location: @gui_view_key_info }
      else
        format.html { render action: "new" }
        format.json { render json: @gui_view_key_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gui/view_key_infos/1
  # PUT /gui/view_key_infos/1.json
  def update
    @gui_view_key_info = Gui::ViewKeyInfo.find(params[:id])

    respond_to do |format|
      if @gui_view_key_info.update_attributes(params[:gui_view_key_info])
        format.html { redirect_to @gui_view_key_info, notice: 'View key info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gui_view_key_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gui/view_key_infos/1
  # DELETE /gui/view_key_infos/1.json
  def destroy
    @gui_view_key_info = Gui::ViewKeyInfo.find(params[:id])
    @gui_view_key_info.destroy

    respond_to do |format|
      format.html { redirect_to gui_view_key_infos_url }
      format.json { head :no_content }
    end
  end
end
