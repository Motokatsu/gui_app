class Gui::LogicsController < ApplicationController
  # GET /gui/logics
  # GET /gui/logics.json
  def index
    @gui_logics = Gui::Logic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gui_logics }
    end
  end

  # GET /gui/logics/1
  # GET /gui/logics/1.json
  def show
    @logic = Gui::Logic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gui_logic }
    end
  end

  # GET /gui/logics/new
  # GET /gui/logics/new.json
  def new
    @gui_logic = Gui::Logic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gui_logic }
    end
  end

  # GET /gui/logics/1/edit
  def edit
    @gui_logic = Gui::Logic.find(params[:id])
  end

  # POST /gui/logics
  # POST /gui/logics.json
  def create
    @gui_logic = Gui::Logic.new(params[:gui_logic])

    respond_to do |format|
      if @gui_logic.save
        format.html { redirect_to @gui_logic, notice: 'Logic was successfully created.' }
        format.json { render json: @gui_logic, status: :created, location: @gui_logic }
      else
        format.html { render action: "new" }
        format.json { render json: @gui_logic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gui/logics/1
  # PUT /gui/logics/1.json
  def update
    @gui_logic = Gui::Logic.find(params[:id])

    respond_to do |format|
      if @gui_logic.update_attributes(params[:gui_logic])
        format.html { redirect_to @gui_logic, notice: 'Logic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gui_logic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gui/logics/1
  # DELETE /gui/logics/1.json
  def destroy
    @gui_logic = Gui::Logic.find(params[:id])
    @gui_logic.destroy

    respond_to do |format|
      format.html { redirect_to gui_logics_url }
      format.json { head :no_content }
    end
  end
end
