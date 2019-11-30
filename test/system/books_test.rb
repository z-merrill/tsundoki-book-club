require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Unread Books"
  end

  test "searching and selecting a book" do
    visit books_url
    fill_in "search_field", with: "Berta Isla"
    click_on "Search"

    assert_selector "h1", text: "Results Books"

    click_on "Create Book", match: :first

    assert_selector "#notice", text: "Book was successfully created."
  end


  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Author", with: @book.author
    fill_in "Description", with: @book.description
    fill_in "Genre", with: @book.genre
    fill_in "Rating", with: @book.rating
    fill_in "Review", with: @book.review
    fill_in "Title", with: @book.title
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    create_book

    visit books_url
    click_on "Edit", match: :first

    fill_in "Author", with: @book.author
    fill_in "Description", with: @book.description
    fill_in "Genre", with: @book.genre
    fill_in "Rating", with: @book.rating
    fill_in "Review", with: @book.review
    fill_in "Title", with: @book.title
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    create_book

    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end

  def create_book
    visit books_url
    click_on "New Book"

    fill_in "Author", with: @book.author
    fill_in "Description", with: @book.description
    fill_in "Genre", with: @book.genre
    fill_in "Rating", with: @book.rating
    fill_in "Review", with: @book.review
    fill_in "Title", with: @book.title
    click_on "Create Book"
  end
end
