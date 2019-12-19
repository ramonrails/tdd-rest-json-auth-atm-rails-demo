class TellersController < ApplicationController
  before_action :set_teller, only: [:show, :update, :destroy]

  # GET /tellers
  def index
    @tellers = @user && @user.isadmin ? Teller.balance : {}

    render json: @tellers
  end

  # GET /tellers/1
  def show
    render json: @teller
  end

  # POST /tellers
  def create
    @teller = Teller.new(teller_params)

    if @teller.save
      render json: @teller, status: :created, location: @teller
    else
      render json: @teller.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tellers/1
  def update
    if @teller.update(teller_params)
      render json: @teller
    else
      render json: @teller.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tellers/1
  def destroy
    @teller.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teller
      @teller = Teller.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teller_params
      params.require(:teller).permit(:denomination, :notes)
    end
end
