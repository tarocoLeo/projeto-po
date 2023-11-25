# Projeto para PO
BCC 8º Termo
Prof. Sabatine

### Integrantes do grupo
- Isabelle Araujo Sepulveda - 60382-1
- José Vitor de Araujo - 60331-7
- Leonardo Taroco Santana - 60776-2
- Rodrigo de Oliveira dos Santos - 60253-1
- Vitor Alexandre Oliveira da Silva - 60913-7

### Enunciado
Criar um cliente que simula um dispositivo de rastreio e envia uma nova coordenada a cada 3 segundos. Os dados serão enviado para um broker mqtt. O nível de QoS das mensagens deve ser exatamente uma vez.

Criar uma API da dados que recebe dados de localização via broker do MQTT. Os dados enviados devem ser: ID do dispositivo e Latitude e longitude. Ao receber os dados a API e encaminha para fila.

Deve ser criado uma API de rastreio que retira a localização da fila, verifica se o dispositivo existe e está ativo e salva no banco de dados e na cache.

A cache deve armazenar dados somente do dia e limpar quando o dia virar.

A estrutura do banco de dados deve ser a seguinte

Tabela: Dispostivo
id UUID
nome varchar(80)
codigo (8)
ativo boolean
marca (80)

Tabela: Localizacao
id UUID
id_dispostivo UUID
latitude double
longitude double

A API de rastreio deve ter uma API Rest (padrão RESTful com nível de maturidade 2, porém com Hateoas no histórico de localização de um dispositivo) para permitir o registro, alteração, consulta e remoção e consulta do histórico de localização do dispositivo. Deve ter também um websocket para permitir algum cliente receber a última localização.

A API de métricas deve receber via grpc as novas localizações, a marca e o id do dispositivo da API de rastreio, processar a distância acumulada e incrementar o número de posições e salvar no banco de dados. As informações serão disponibilizadas em um webservice graphql com as seguintes query: 
consultaDispositivo (id_dispositivo, dia) - pode retornar: id_dispositivo, marca, quantidade_posição, total_km 
consultaMarca(marca, dia) - pode retornar: quantidade_dispositivo, marca, quantidade_posição, total_km 
consultaGeral(dia) pode retornar quantidade_dispositivo, quantidade_posição, total_km 

Deve ser criada uma página web com mapa apresentando a última localização de um dispositivo especifico. 

Deve ser criada uma coleção no postman documentando as APIs

---