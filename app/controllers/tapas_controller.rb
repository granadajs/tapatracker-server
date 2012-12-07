class TapasController < ApplicationController
  def new
    @tapa = Tapa.new
  end

  def create
    @tapa = Tapa.new(params[:tapa])
    @tapa.add_rating params[:rating]
    @tapa.user_id = current_user.id
    if @tapa.save
      redirect_to tapa_path(@tapa), notice: "Tapa review saved!"
    else
      render :new, alert: "Error processing your request!"
    end
  end

  def show
    @tapa = Tapa.find params[:id]
  end
end
