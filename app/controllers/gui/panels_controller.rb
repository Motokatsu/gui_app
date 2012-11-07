class Gui::PanelsController < ApplicationController
  # GET /gui/panels
  # GET /gui/panels.json
  def index
    @panels = Gui::Panel.all
  end

  # GET /gui/panels/1
  # GET /gui/panels/1.json
  def show
    @panel = Gui::Panel.find(params[:id])
    redirect_to @panel.images[0] unless @panel.images.empty?

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @gui_panel }
    # end
  end

  # GET /gui/panels/new
  # GET /gui/panels/new.json
  def new
    @panel = Gui::Panel.new
    @title = "Create Panel"
  end

  # GET /gui/panels/1/edit
  def edit
    @gui_panel = Gui::Panel.find(params[:id])
  end

  # POST /gui/panels
  # POST /gui/panels.json
  def create
    @panel = Gui::Panel.new(params[:gui_panel])
    if @panel.save
      flash[:success] = 'Panel was successfully created.'
      redirect_to @panel
    else
      @title = "Create Panel"
      render 'new'
    end
  end

  # PUT /gui/panels/1
  # PUT /gui/panels/1.json
  def update
    @panel = Gui::Panel.find(params[:id])
    if @panel.update_attributes(params[:gui_panel])
      flash[:success] = 'Panel was successfully updated.'
      redirect_to @panel
    else
      @title = "Update Panel"
      render 'edit'
    end
  end

  # DELETE /gui/panels/1
  # DELETE /gui/panels/1.json
  def destroy
    @gui_panel = Gui::Panel.find(params[:id])
    @gui_panel.destroy

    respond_to do |format|
      format.html { redirect_to gui_panels_url }
      format.json { head :no_content }
    end
  end
end
