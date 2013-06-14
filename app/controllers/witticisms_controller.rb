class WitticismsController < ApplicationController
  before_action :set_witticism, only: [:show, :edit, :update, :destroy]

  # GET /witticisms
  # GET /witticisms.json
  def index
    @witticisms = Witticism.all
  end

  # GET /witticisms/1
  # GET /witticisms/1.json
  def show
  end

  # GET /witticisms/new
  def new
    @witticism = Witticism.new
  end

  # GET /witticisms/1/edit
  def edit
  end

  def random
  end

  # POST /witticisms
  # POST /witticisms.json
  def create
    @witticism = Witticism.new(witticism_params)
    @witticism.quote = params['witticism']['quote']
    respond_to do |format|
      if @witticism.save
        # add chappelle, kaufman, and mitch hedburg
        logger.info((@witticism.id.to_s + " ") * 10)
        format.html { redirect_to @witticism, notice: 'Witticism was successfully created.' }
        format.json { render action: 'show', status: :created, location: @witticism }
      else
        format.html { render action: 'new' }
        format.json { render json: @witticism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /witticisms/1
  # PATCH/PUT /witticisms/1.json
  def update
    respond_to do |format|
      if @witticism.update(witticism_params)
        format.html { redirect_to @witticism, notice: 'Witticism was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @witticism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /witticisms/1
  # DELETE /witticisms/1.json
  def destroy
    @witticism.destroy
    respond_to do |format|
      format.html { redirect_to witticisms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_witticism
      @witticism = Witticism.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def witticism_params
      params.require(:witticism).permit(:quote)
    end
end
