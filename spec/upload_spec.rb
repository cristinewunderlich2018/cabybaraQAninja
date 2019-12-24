describe 'Upload', :upload do
    
    before(:each) do
        #visit 'https://training-wheels-protocol.herokuapp.com/upload'
        #guardar o caminho do arquivo no projeto usando o pwd para pegar o diretório de execução do projeto que pode mudar
        # colocar o @ na frente da variavel de instância
        @arquivo = Dir.pwd + '/spec/fictures/texto.txt'
        @imagem = Dir.pwd + '/spec/fictures/ironman.jpg'
    end

    it 'upload com arquivo texto' do
        puts @arquivo
    end

    after(:each) do
        sleep 3
    end
end