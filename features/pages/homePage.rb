class Home < SitePrism::Page
  
  element :logo, :css, '#nav-logo span.nav-sprite.nav-logo-base'
  element :input_busca, :css, '#twotabsearchtextbox'
  element :button_busca, :css, '.nav-search-submit input'

  def buscar_produto(texto)
    wait_until_input_busca_visible
    input_busca.set texto
    button_busca.click
  end

end

