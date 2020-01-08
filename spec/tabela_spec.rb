describe 'Tabelas', :tabela do
    before(:each) do
        visit '/tables'
    end

    it 'exibe salario do Toni Stark' do
        ##pegar apenas o elementos da tabela, all retorna todos os elementos
        atores = all('table tbody tr')
        ##identificar qual linha deve pesquisar
        ##dentro das linhas pergunta se tem o texto específico
        stark = atores.detect {|ator| ator.text.include?('Robert Downey Jr')}
        #puts stark.text
        ##verificando na linha do stark se tem o valor específico
        expect(stark.text).to include '10.000.000'
    end

    it 'Deve exibir o salario do 3X' do
        ##busca uma linha da tabale de forma mais elegante
        ##passando um seletor CSS com um texto
        diesel = find('table tbody tr', text: 'Vin Diesel')
        #puts diesel.text
        expect(diesel).to have_content '10.000.000'
    end

    it 'Deve exibir o filme Velozes' do
        velozes = find('table tbody tr', text: 'Vin Diesel')
        #puts velozes.text
        ##trazer todas as colunas da linha seleciona acima
        ##e pegar a posição da coluna a ser verificada
        coluna = velozes.all('td')[2].text
        ##verificando pela coluna da tabela
        expect(coluna).to eql 'Velozes e Furiosos'
    end

    it 'Deve exibir o insta do Capitão' do
        cap = find('table tbody tr', text: 'Chris Evans')
        coluna = cap.all('td')[4].text

        expect(coluna).to eql '@teamcevans'
    end

    it 'Deve selecionar o Chris Pratt para remoção' do
        estrelas = find('table tbody tr', text: 'Chris Pratt')
        #puts estrelas
        ##dentro do registro pegar o link para clicar
        estrelas.find('a', text: 'delete').click
        ##pegar o alerta do navegador
        alerta = page.driver.browser.switch_to.alert.text
        expect(alerta).to eql 'Chris Pratt foi selecionado para remoção!'
        sleep 3
    end

    it 'Deve selecionar o Chris Pratt para edição' do
        estrelas = find('table tbody tr', text: 'Chris Pratt')
        #puts estrelas
        ##dentro do registro pegar o link para clicar
        estrelas.find('a', text: 'edit').click
        ##pegar o alerta do navegador
        alerta = page.driver.browser.switch_to.alert.text
        expect(alerta).to eql 'Chris Pratt foi selecionado para edição!'
        sleep 3
    end
end