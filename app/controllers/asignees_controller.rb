class AsigneesController < ApplicationController
  before_action :set_asignee, only: %i[ show edit update destroy ]

  # GET /asignees or /asignees.json
  def index
    @asignees = Asignee.all
  end

  # GET /asignees/1 or /asignees/1.json
  def show
  end

  # GET /asignees/new
  def new
    @asignee = Asignee.new
  end

  # GET /asignees/1/edit
  def edit
  end

  # POST /asignees or /asignees.json
  def create
    @asignee = Asignee.new(asignee_params)

    respond_to do |format|
      if @asignee.save
        format.html { redirect_to asignee_url(@asignee), notice: "Asignee was successfully created." }
        format.json { render :show, status: :created, location: @asignee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asignee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignees/1 or /asignees/1.json
  def update
    respond_to do |format|
      if @asignee.update(asignee_params)
        format.html { redirect_to asignee_url(@asignee), notice: "Asignee was successfully updated." }
        format.json { render :show, status: :ok, location: @asignee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asignee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignees/1 or /asignees/1.json
  def destroy
    @asignee.destroy!

    respond_to do |format|
      format.html { redirect_to asignees_url, notice: "Asignee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignee
      @asignee = Asignee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asignee_params
      params.require(:asignee).permit(:name, :is_coach)
    end
end
