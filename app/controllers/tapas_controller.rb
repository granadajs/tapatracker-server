class TapasController < ApplicationController
  def new
    @tapa = Tapa.new
  end

  def create
    @tapa = Tapa.new(params[:tapa])
    @tapa.user_id = current_user.id
    if @tapa.save
      @tapa.add_rating params[:rating]
      redirect_to tapa_path(@tapa), notice: "Tapa review saved!"
    else
      render :new, alert: "Error processing your request!"
    end
  end

  def show
    @tapa = Tapa.find params[:id]
  end
end
