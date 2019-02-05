Dado("que eu realize uma requisição de GET") do
  @rest_client = RestService.new
  @rest_client.url = ENVIRONMENT['API']['WEBSERVICE']['get']
  @response = @rest_client.get
end
  
Entao("receberei status {int}") do |code|
  @response.code.should be == code
end

Entao("a quantidade de países deve ser igual ao total retornado") do
  paises = @rest_client.to_openStruct(@response.body).RestResponse.result.size
  @rest_client.to_openStruct(@response.body).RestResponse.messages[0].should include(paises.to_s)
end

Entao("sera retornado o pais {string} com alpha_code {string}") do |pais, alpha_code|
  r = false
  @rest_client.to_openStruct(@response.body).RestResponse.result.each do |e|
    if e.name == pais
      r = true if e.alpha2_code == alpha_code
      r = true if e.alpha3_code == alpha_code
      break
    end
  end
  r.should be true
end