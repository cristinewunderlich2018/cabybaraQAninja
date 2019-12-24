describe 'hover', :hovers do
    
before(:each) do
    visit 'https://training-wheels-protocol.herokuapp.com/hovers'
end

it 'quando passo o mouse sobre o Blade' do
    #identifica o elemento
    #card = find('img[alt=Blade]')
    
    #pesquisando um elemento que contem com tal valor
    card = find('img[alt*=Blade]')
    
    #passa o mouse no elemento
    card.hover
    #verificando que mostra o nome do card ao passar o mouse
    expect(page).to have_content 'Nome: Blade'
end

it 'quando passo o mouse sobre o Pantera negra' do
    #o seletor não identifica valores separados deve passar como string dentro de ""
    #card = find('img[alt="Pantera Negra"]')
    
    #pesquisando um elemento que começe com tal valor
    card = find('img[alt^=Pantera]')
    card.hover

    expect(page).to have_content 'Nome: Pantera Negra'
end

it 'quando passo o mouse sobre o Homeme Aranha' do
    #o seletor não identifica valores separados deve passar como string dentro de ""
    #card = find('img[alt="Homem Aranha"]')
    
    #pesquisando um elemento que termina com tal valor
    card = find('img[alt$=Aranha]')
    card.hover

    expect(page).to have_content 'Nome: Homem Aranha'
end

after(:each) do
    sleep 0.5
end

end