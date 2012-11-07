class Gui::DialogsController < ApplicationController
  # GET /gui/dialogs
  # GET /gui/dialogs.json
  def index
    @gui_dialogs = Gui::Dialog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gui_dialogs }
    end
  end

  # GET /gui/dialogs/1
  # GET /gui/dialogs/1.json
  def show
    @gui_dialog = Gui::Dialog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gui_dialog }
    end
  end

  # GET /gui/dialogs/new
  # GET /gui/dialogs/new.json
  def new
    @gui_dialog = Gui::Dialog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gui_dialog }
    end
  end

  # GET /gui/dialogs/1/edit
  def edit
    @gui_dialog = Gui::Dialog.find(params[:id])
  end

  # POST /gui/dialogs
  # POST /gui/dialogs.json
  def create
    @gui_dialog = Gui::Dialog.new(params[:gui_dialog])

    respond_to do |format|
      if @gui_dialog.save
        format.html { redirect_to @gui_dialog, notice: 'Dialog was successfully created.' }
        format.json { render json: @gui_dialog, status: :created, location: @gui_dialog }
      else
        format.html { render action: "new" }
        format.json { render json: @gui_dialog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gui/dialogs/1
  # PUT /gui/dialogs/1.json
  def update
    @gui_dialog = Gui::Dialog.find(params[:id])

    respond_to do |format|
      if @gui_dialog.update_attributes(params[:gui_dialog])
        format.html { redirect_to @gui_dialog, notice: 'Dialog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gui_dialog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gui/dialogs/1
  # DELETE /gui/dialogs/1.json
  def destroy
    @gui_dialog = Gui::Dialog.find(params[:id])
    @gui_dialog.destroy

    respond_to do |format|
      format.html { redirect_to gui_dialogs_url }
      format.json { head :no_content }
    end
  end
end
