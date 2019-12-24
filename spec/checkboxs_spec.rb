describe 'caixa de seleção', :checkbox do
    
    #colcoar o visit para todos os cenários
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/checkboxes'
    end

    it 'marcando uma opção' do
        #marcar o filme Thor do tipo checkbox
        check('thor')
    end

    it 'desmarcando uma opção' do
        # desmar apenas se já estiver selecionado
        uncheck('antman')
    end

    it 'marcando com find set true' do
        #buscar o elemento
        find('input[value=cap]').set(true)
    end

    it 'desmarcando com find set false' do
        #busca o elemento
        find('input[value=guardians]').set(false)
    end

    #vai executar o método para cada cenário
    after(:each) do
        sleep 3
    end

end