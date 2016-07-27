feature 'Adding tags' do
  scenario 'adding a tag to a link' do
    visit 'links/new'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'tags', :with => 'coding'
    click_button 'Save link'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'coding'
  end

  scenario 'adding mutiple tags to a link' do
    visit 'links/new'
    fill_in 'url', :with => 'http://www.makersacademy.com'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'tags', :with => 'coding education academia'
    click_button 'Save link'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'coding', 'education', 'academia'
  end
end
