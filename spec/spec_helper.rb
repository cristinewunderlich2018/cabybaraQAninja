require 'capybara'
require 'capybara/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  ##antes de cada cenário redimencionar o browser
  config.before(:example) do
      page.current_window.resize_to(1200,800)
  end

  ##passando no nome do cenário para gerar o nome do arquivo
  config.after(:example) do |e|
    ##pega o nome e substitui os espaços por _
    cenario = e.description.gsub(/[^A-Za-z0-9 ]/,'').tr(' ','_')
    ##pegar evidencia dos testes que falham
    page.save_screenshot('log/' + cenario + '.png') if e.exception
  end

end

Capybara.configure do |config|
  ##sem subir o navegador
  config.default_driver = :selenium_chrome_headless
  ##com o navegador
  #config.default_driver = :selenium_chrome
  config.default_max_wait_time = 5
  ##definir URL padrão do sistama
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'

end
