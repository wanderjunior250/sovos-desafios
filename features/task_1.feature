#language: pt
#utf-8

@api @task_1
Funcionalidade: Task 1
  Validar retorno de chamada GET

@get
Cenário: Validar quantidade de paises
  Dado que eu realize uma requisição de GET
  Entao receberei status 200
  E a quantidade de países deve ser igual ao total retornado

@get @desenvolvendo
Esquema do Cenário: Validar país retornado
  Dado que eu realize uma requisição de GET
  Entao receberei status 200
  E sera retornado o pais <pais> com alpha_code <alpha_code>

  Exemplos:
  | pais | alpha_code |
  | "Afghanistan" | "AF" |
  | "Hong Kong" | "HKG" |
  | "Hong Kong" | "Falha" |