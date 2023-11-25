require 'mqtt'
require 'json'
require 'securerandom'
require 'time'

MQTT_BROKER = 'mqtt://broker.doleozin.com'
MQTT_TOPIC = 'localizacao'

def generate_coordinates
  latitude = rand(-90.0..90.0).round(6)
  longitude = rand(-180.0..180.0).round(6)
  { latitude: latitude, longitude: longitude }
end

def generate_location_message(device_id)
  coordinates = generate_coordinates
  { id: device_id, latitude: coordinates[:latitude], longitude: coordinates[:longitude], timestamp: Time.now.iso8601 }
end

def publish_location(client, device_id)
  location_message = generate_location_message(device_id)
  client.publish(MQTT_TOPIC, location_message.to_json)
  puts "Mensagem publicada: #{location_message}"
end

device_id = SecureRandom.uuid

MQTT::Client.connect(MQTT_BROKER) do |client|
  puts "Conectado ao broker MQTT como dispositivo #{device_id}"

  loop do
    publish_location(client, device_id)
    sleep(3)
  end
end
