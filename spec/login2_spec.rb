describe 'Forms', :login2 do
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/login2'
    end

    it 'com data de nascimento' do
        
        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'

        #captura o formulario (atributos)
        loginForm = find('#login')

        #inicia o case com o texto do formulario
        case loginForm.text
        #quando tiver a palavra Dia dentro do texto do formulario
        when /Dia/
            #eu preencho com o valor 29
            find('#day').set '29'
        #quando tiver a palavra Mês dentro do texto do formulario
        when /Mês/
            find('#month').set '05'
            #eu preencho com o valor 05
        #quando tiver a palavra Ano dentro do texto do formulario
        when /Ano/
            find('#year').set '1970'
            #eu preencho com o valor 1970
        end
        
        click_button 'Login'

        #validar a mesagem na página usando o 'include' se contem tal mensagem
        #expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        #forma mais elegante, se exite o conteudo no elemento
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end
end