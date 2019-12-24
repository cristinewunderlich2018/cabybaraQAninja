describe 'caixa de opções', :dropdown do
    
    it 'item especifico simples' do
        #selecionar a opção atravez do elemento pelo ID
        #só funciona com elemento select com ID
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3
    end

    #metodo com elemento sem ID, buncando por outro seletor
    it 'item especifico com find' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        #guarda o elemento
        drop = find('.avenger-list')
        #buscar dentro da varialvel uma opção com o texto 
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end

    # metodo para selecionar qual item da lista
    it 'qualquer item', :sample do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        #guarda o elemento
        drop = find('.avenger-list')
        #busca específica, o metodo find deve retornar apenas 1 elemento
        #drop.find('option')
        #metodo all traz um array com as oções, o sample sorteia uma opção
        #select_option seleciona o item sorteado
        drop.all('option').sample.select_option
        sleep 3

    end
end