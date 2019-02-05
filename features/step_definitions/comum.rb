Dado("que eu esteja na pagina inicial da loja Amazon") do
  visit ENVIRONMENT['APP']['home']
  @app.home.wait_until_logo_visible
end