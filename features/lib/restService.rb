require 'rest-client'

#Utilizada para requisições do tipo REST (JSON)
class RestService
 
  #url usada para envio de requisições POST e GET
  attr_accessor :url 
  #objeto com a resposta obtida pela requisição, contendo inclusive status, headers, body, etc
  attr_accessor :response 
  #body requisição a ser enviada
  attr_accessor :payload 
  #usuario usado para envio requisição
  attr_accessor :user 
  #senha utilizada para envio requisição
  attr_accessor :password 
  attr_accessor :headers


  def initialize()
    @url = ''
    @user = ''
    @password = ''
    @headers = ''
  end

  # Realiza uma requisição post utilizando os argumentos passados por paramêtro
  # é necessário setar a url, usuário e senha previamente
  # ====== @params
  # * +params+ - Hash com os objetos: :payload e :headers
  # ====== @return
  #  @response = resposta completa requisição
  def custom_post(params)
    params[:method] = :post
    set_client(params)
    response
    return @response
  end

  # Realiza uma requisição GET que necessita de autorização
  # ====== @return
  #  @response = resposta completa requisição
  def custom_get()
    @client = RestClient::Resource.new(@url)
    setAuthorizationToken
    puts authorization
    @response = @client.get(:Authorization => authorization)
    return @response
  end

  # Realiza uma requisição get simples utilizando apenas a url instância do objeto utilizado
  # ====== @return
  #  @response = resposta completa requisição
  def get
    @response = RestClient.get @url
    return @response
  end

  # Realiza uma requisição post simples utilizando apenas a url instância do objeto utilizado
  # ====== @return
  #  @response = resposta completa requisição
  def post
    @response = RestClient.post @url
    return @response
  end

  # Cria um cliente passando os argumentos do paramêtro
  # ====== @params
  # * +params+ - Hash com os objetos: :method, :payload e :headers
  # ====== @return
  #  @cliente
  private def set_client(params)
    @client = RestClient::Request.new({
      method: params[:method],
      url: @url,
      user: @user,
      password: @password,
      payload: params[:payload],
      headers: params[:headers]   #{ :accept => :json, content_type: :json }
    })
    return @client
  end

  # Retorna o cliente
  # ====== @return
  #  @cliente
  def client
    return @client
  end

  # Realiza a execução de um @cliente retornando a sua resposta
  # ====== @return
  #  @response = resposta completa operação
  
  private def response
    @client.execute do |response, request, result|
      @response = response
      case response.code
        when 400
        	fail "Erro ao executar. Código resposta: " + response.code.to_s + " \nBody: " + response.body
        	#puts JSON.pretty_generate(JSON.parse(response))
        when 200
        	#SUCESS
        else
        	fail "Invalid response #{response.to_s} received."
      end
    end
    return @response
  end
  
  # Transforma um objeto json em um objeto nativo ruby OpenStruct
  # ====== @params
  # * +json+ - json que deseja transformar
  # ====== @return
  #  Objeto OpenStruct
  def to_openStruct(json)
    return JSON.parse(json, object_class: OpenStruct)
  end
end