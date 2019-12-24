describe 'Drag and Drop', :drop do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/drag_and_drop'
    end

    it 'Homem Aranha pertence ao time do Stark' do
        #identificar as áreas para alteração
        stark = find('.team-stark .column')
        cap = find('.team-cap .column')

        spiderman = find('img[alt$=Aranha]')
        #clicar e arrasta pra div de destino
        spiderman.drag_to stark

        #verificar se a imagem está no destino
        expect(stark).to have_css 'img[alt$=Aranha]'
        #verificar que a imagem não está mais na origem
        expect(cap).not_to have_css 'img[alt$=Aranha]'
    end

end