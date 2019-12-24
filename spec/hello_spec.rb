describe 'Meu primeiro scrip' do
    
    it 'visitar a pagina' do
        visit 'https://training-wheels-protocol.herokuapp.com/'
        expect(page.title).to eql 'Training Wheels Protocol'
    end
end