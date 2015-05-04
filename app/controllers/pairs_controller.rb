class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pairs = Pair.all
    respond_with(@pairs)
  end

  def show
    respond_with(@pair)
  end

  def new
    @pair = Pair.new
    respond_with(@pair)
  end

  def edit
  end

  def create
    @pair = Pair.new(pair_params)
    flash[:notice] = 'Pair was successfully created.' if @pair.save
    respond_with(@pair)
  end

  def update
    flash[:notice] = 'Pair was successfully updated.' if @pair.update(pair_params)
    respond_with(@pair)
  end

  def destroy
    @pair.destroy
    respond_with(@pair)
  end

  private
    def set_pair
      @pair = Pair.find(params[:id])
    end

    def pair_params
      params.require(:pair).permit(:partner_1, :partner_2)
    end
end
