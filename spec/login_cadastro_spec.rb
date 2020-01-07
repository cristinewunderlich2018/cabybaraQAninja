describe 'Cadastro', :login3 do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'com sucesso' do
        
        ##resolvendo o problema quando encontra mais de um elemento com o mesmo nome
        ##utilizando o ESCOPO do capybara
        ##identificar o elemento pai para restringir a busca na pagina
        #loginForm = find('#login')

        ##buscar dentro do formulario
        #loginForm.find('input[name=username]').set 'stark'
        #loginForm.find('input[name=password]').set 'jarvis!'
       
        #forma mais elegante de trabalhar com ESCOPO
        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
        end

        click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'Cadastro com sucesso' do
        within('#signup') do
            find('input[name=username]').set 'fernando'
            find('input[name=password]').set '123456'
        end

        #clicar no elemento que é um link
        click_link 'Criar Conta'
        expect(find('#result')).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

end