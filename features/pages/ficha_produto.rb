class FichaProduto < SitePrism::Page
  
  elements :labels_produtos_relacionados, :css, ''

  def exibir_produtos_relacionados
    fail("Não exibia para mim produtos relacionados!")
  end

end
