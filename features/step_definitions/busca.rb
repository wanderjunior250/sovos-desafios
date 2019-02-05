Entao("estara visivel o titulo e preco do primeiro produto") do
  @app.busca.exibir_nome_e_preco_primeiro_produto
end

Quando("eu acessar o primeiro produto da busca") do
  @app.busca.labels_nome_produtos[0].click
end