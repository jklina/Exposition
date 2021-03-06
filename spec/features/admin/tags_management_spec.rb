require "rails_helper"

RSpec.feature "Tag management", :type => :feature do
  scenario "user can view tags" do
    create_user_and_login
    tag = create(:tag)

    visit exposition.admin_tags_path

    expect(page).to have_text(tag.label)
  end

  it do
    create_user_and_login
    paginates(factory: :tag, increment: 25, selector: '.tag') do
      visit exposition.admin_tags_path
    end
  end

  scenario "user can create tags " do
    create_user_and_login

    visit exposition.new_admin_tag_path

    fill_in "Label", with: "my tag"
    click_on "Create Tag"

    expect(current_path).to eq(exposition.admin_tags_path)
    expect(page).to have_content("my tag")
  end

  scenario "user can edit tags " do
    create_user_and_login
    tag = create(:tag, label: 'Old Label')

    visit exposition.edit_admin_tag_path(tag)

    fill_in "Label", with: "New Label"
    click_on "Update Tag"

    expect(current_path).to eq(exposition.admin_tags_path)
    expect(page).to have_text("New Label")
  end

  scenario "user can delete tags " do
    create_user_and_login
    tag = create(:tag, label: 'My Label')

    visit exposition.admin_tags_path

    expect(page).to have_text("My Label")

    click_on "Delete"

    expect(current_path).to eq(exposition.admin_tags_path)
    expect(page).to_not have_text("My Label")
  end
end

