class HistoricoLocalizacoesController < ApplicationController
  before_action :set_historico_localizacao, only: [:show, :update, :destroy]

  def index
    @historico_localizacoes = HistoricoLocalizacao.all
    render json: @historico_localizacoes
  end

  def show
    render json: @historico_localizacao
  end

  def create
    @historico_localizacao = HistoricoLocalizacao.new(historico_localizacao_params)

    if @historico_localizacao.save
      render json: @historico_localizacao, status: :created, location: @historico_localizacao
    else
      render json: @historico_localizacao.errors, status: :unprocessable_entity
    end
  end

  def update
    if @historico_localizacao.update(historico_localizacao_params)
      render json: @historico_localizacao
    else
      render json: @historico_localizacao.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @historico_localizacao.destroy
  end

  private

  def set_historico_localizacao
    @historico_localizacao = HistoricoLocalizacao.find(params[:id])
  end

  def historico_localizacao_params
    params.require(:historico_localizacao).permit(:dispositivo_id, :latitude, :longitude, :timestamp)
  end
end
