#language: pt
#utf-8

@app @task_2
Funcionalidade: Task 2
  Eu como cliente Amazon
  Quero realizar busca por produtos
  Para que possa encontrar e comprar produtos

Contexto:
  Dado que eu esteja na pagina inicial da loja Amazon
  Quando eu realizar busca utilizando massa "search_1"

@positivo
Cenário: Validar titulo e preço de primeiro produto
  Entao estara visivel o titulo e preco do primeiro produto

@positivo
Cenário: Validar lista de produtos relacionados
  Quando eu acessar o primeiro produto da busca
  Entao sera exibida lista de produtos relacionados

