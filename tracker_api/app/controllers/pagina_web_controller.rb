class PaginaWebController < ApplicationController
  def index
    @ultima_localizacao = Localizacao.where(device_id: 1).order(timestamp: :desc).first
  end
end
