Quando("eu realizar busca utilizando massa {string}") do |massa|
  @app.home.buscar_produto(MASS['AMAZON']['search'][massa])
end