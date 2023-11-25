class LocalizacoesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = JSON.parse(request.body.read)
    localizacao = Localizacao.new(device_id: SecureRandom.uuid, latitude: data['latitude'], longitude: data['longitude'], timestamp: Time.parse(data['timestamp']))

    if localizacao.save
      render json: { status: 'Localizacao recebida com sucesso' }, status: :created
    else
      render json: { error: 'Falha ao processar a localizacao' }, status: :unprocessable_entity
    end
  end
end
