require "rails_helper"

feature 'user can browse list of files' do

  background do
    Dir.chdir(Dir.home)
    Dir.mkdir('test-files')
    File.new("test-files/test.txt","w")
    Dir.chdir(Dir.home)

    visit root_path
  end

  scenario 'files in home directory' do
    expect(page).to have_content 'Web File Manager'
    expect(page).to have_content 'test-files'
    File.delete('test-files/test.txt')
    Dir.delete('test-files')
  end

  scenario 'file in subfolder' do
    click_on 'test-files'
    expect(page).to have_content 'test'
    Dir.chdir(Dir.home)
    File.delete('test-files/test.txt')
    Dir.delete('test-files')
  end
end
