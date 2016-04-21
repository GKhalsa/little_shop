require "rails_helper"

RSpec.feature "User can view category index" do
  scenario "they see the items sorted by category" do
    category = Category.create(name: "Haikus")
    Item.create(title: "Item 1",
               description: "This is the first item",
               price: 9.99,
               image_path: "example.image",
               category_id: category.id)

    Item.create(title: "Item 2",
               description: "This is the second item",
               price: 5.99,
               image_path: "example.image/2")

    visit category_path(category.name)

    expect(page).to have_content("Item 1")
    expect(page).to have_content("9.99")
    expect(page).to have_css("img[src=\"/images/example.image\"]")

    expect(page).not_to have_content("Item 2")
    expect(page).not_to have_content("5.99")
    expect(page).not_to have_css("img[src=\"/images/example.image/2\"]")
  end
end
