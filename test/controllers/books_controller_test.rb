require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

### INDEX TESTS
  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should load unread books" do
    get books_url
    assert assigns(:unread_books).size == 3

    assigns(:unread_books).each do | book |
      assert !book.image_url.nil? && !book.image_url.empty?
    end
  end

  test "should load read books" do
    get books_url
    assert assigns(:read_books).size == 2

    assigns(:read_books).each do | book |
      assert !book.image_url.nil? && !book.image_url.empty?
    end
  end

  test "should load current book" do
    get books_url
    assert assigns(:current_books).size == 1

    assigns(:current_books).each do | book |
      assert !book.image_url.nil? && !book.image_url.empty?
    end
  end

  # TODO - Brittle tests, need to mock rest call
  test "should execute search" do
    get search_books_url, params: { q: "Berta Isla" }
    assert_response :success

    assert assigns(:results).size == 2

    assigns(:results).each do | book |
      assert !book.title.nil? && !book.title.empty?
      assert !book.author.nil? && !book.author.empty?
      assert !book.image_url.nil? && !book.image_url.empty?
    end
  end 

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, description: @book.description, genre: @book.genre, rating: @book.rating, review: @book.review, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, rating: @book.rating, review: @book.review, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
