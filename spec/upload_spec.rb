describe 'Upload', :upload do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/upload'
        #guardar o caminho do arquivo no projeto usando o pwd para pegar o diretório de execução do projeto que pode mudar
        # colocar o @ na frente da variavel de instância
        @arquivo = Dir.pwd + '/spec/fictures/texto.txt'
        @imagem = Dir.pwd + '/spec/fictures/ironman.jpg'
    end

    it 'upload com arquivo texto' do
        #anexar o arquivo
        attach_file('file', @arquivo)
        #clica no botão para enviar
        click_button 'Upload'

        #guarda o valor do elemento após subir o arquivo para poder fazer a verificação
        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'texto.txt'
    end

    it 'upload com arquivo de imagem', :upload_imagem do
        #anexar o arquivo
        attach_file('file', @imagem)
        #clica no botão para enviar
        click_button 'Upload'

        #ao carregar a imagem leva alguns segundos para carregar a imagem
        #sleep 5 - forma errada
        #ajuste pra situação feito na configuração do capybara com default_max_wait_time    
        img = find('#new-image')
        #fazer a verificação por um atributo do elemento
        #na imagem o src traz o caminho toda do arquivo
        expect(img[:src]).to include '/uploads/ironman.jpg'
    end

    after(:each) do
        sleep 3
    end
end