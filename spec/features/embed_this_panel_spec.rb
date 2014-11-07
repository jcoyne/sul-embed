require 'rails_helper'

describe 'embed this panel', js: true do
  include PURLFixtures
  let(:request) { Embed::Request.new( {url: 'http://purl.stanford.edu/abc123'}) }
  before do
    stub_purl_response_with_fixture(file_purl)
    send_embed_response
  end
  it 'should be present after a user clicks the button' do
    expect(page).to have_css('.sul-embed-embed-this-panel', visible: false)
    page.find('[data-toggle="sul-embed-embed-this-panel"]', match: :first).click
    expect(page).to have_css('.sul-embed-embed-this-panel', visible: true)
    page.find('[data-toggle="sul-embed-embed-this-panel"]', match: :first).click
    expect(page).to have_css('.sul-embed-embed-this-panel', visible: false)
  end
  it 'should have the form elements for updating the embed code' do
    page.find('[data-toggle="sul-embed-embed-this-panel"]', match: :first).click
    expect(page).to have_css('.sul-embed-options-label', text: 'Select options:')
    expect(page).to have_css('input#title[type="checkbox"]')
    expect(page).to have_css('input#search[type="checkbox"]')
    expect(page).to have_css('input#embed[type="checkbox"]')
    expect(page).to have_css('textarea#iframe-code')
  end
  it 'should update the textarea when the checkboxes are selected' do
    page.find('[data-toggle="sul-embed-embed-this-panel"]', match: :first).click
    expect(page.find('.sul-embed-embed-this-panel textarea').value).to match /src='\S+\/iframe\?url=http:\/\/purl\.stanford\.edu\/ab123cd4567'/
    page.find("input#search[type='checkbox']").trigger('click')
    expect(page.find('.sul-embed-embed-this-panel textarea').value).to match /src='\S+\/iframe\?url=http:\/\/purl\.stanford\.edu\/ab123cd4567&hide_search=true'/
    page.find("input#search[type='checkbox']").trigger('click')
    expect(page.find('.sul-embed-embed-this-panel textarea').value).to match /src='\S+\/iframe\?url=http:\/\/purl\.stanford\.edu\/ab123cd4567'/
  end
end