class DispositivosController < ApplicationController
  before_action :set_dispositivo, only: [:show, :update, :destroy]

  def index
    @dispositivos = Dispositivo.all
    render json: @dispositivos
  end

  def show
    render json: @dispositivo
  end

  def create
    @dispositivo = Dispositivo.new(dispositivo_params)

    if @dispositivo.save
      render json: @dispositivo, status: :created, location: @dispositivo
    else
      render json: @dispositivo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @dispositivo.update(dispositivo_params)
      render json: @dispositivo
    else
      render json: @dispositivo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dispositivo.destroy
  end

  private

  def set_dispositivo
    @dispositivo = Dispositivo.find(params[:id])
  end

  def dispositivo_params
    params.require(:dispositivo).permit(:nome, :codigo, :ativo, :marca)
  end
end
