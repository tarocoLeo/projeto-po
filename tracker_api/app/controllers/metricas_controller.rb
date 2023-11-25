class MetricasController < ApplicationController
  before_action :set_metrica, only: [:show, :update, :destroy]

  def index
    @metricas = Metrica.all
    render json: @metricas
  end

  def show
    render json: @metrica
  end

  def create
    @metrica = Metrica.new(metrica_params)

    if @metrica.save
      render json: @metrica, status: :created, location: @metrica
    else
      render json: @metrica.errors, status: :unprocessable_entity
    end
  end

  def update
    if @metrica.update(metrica_params)
      render json: @metrica
    else
      render json: @metrica.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @metrica.destroy
  end

  private

  def set_metrica
    @metrica = Metrica.find(params[:id])
  end

  def metrica_params
    params.require(:metrica).permit(:dispositivo_id, :marca, :quantidade_posicao, :total_km)
  end
end
