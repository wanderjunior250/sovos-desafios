class Busca < SitePrism::Page
  
  elements :labels_nome_produtos, :css, 'div.a-row.a-spacing-small > div:nth-child(1) > a > h2'
  elements :labels_preco_produtos, :css, '.sx-price-large'

  def exibir_nome_e_preco_primeiro_produto
    puts "PRODUTO 1: NOME " + labels_nome_produtos[0].text
    preco = ""
    preco += labels_preco_produtos[0].find('.sx-price-whole').text + ","
    preco +=labels_preco_produtos[0].find('.sx-price-fractional').text
    puts "PRODUTO 1: PREÇO " + preco
  end

end
