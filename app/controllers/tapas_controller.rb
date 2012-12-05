class TapasController < ApplicationController
  def new
    @tapa = Tapa.new
  end
end
