require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "is not valid without a title" do
    book = Book.new(author: 'Javier Marias')
    assert_not_nil book.errors[:title], 'no validation error for title present'
  end

  test "is not valid without an author" do
    book = Book.new(title: 'Berta Isla')
    assert_not_nil book.errors[:author], 'no validation error for author present'
  end

  test "is valid with valid attributes" do
    book = Book.new(title: 'Berta Isla', author: 'Javier Marias')
    assert book.valid?
  end  

  test "has a default status of unread before save" do
    book = Book.new(title: 'Berta Isla', author: 'Javier Marias')
    book.save
    assert book.status == 'UNREAD'
  end

  test "scope allows query by status" do
    book = Book.new(title: 'Berta Isla', author: 'Javier Marias')
    book.save
    book = Book.new(title: 'The Watchmen', author: 'Alan Moore')
    book.save

    results = Book.status('UNREAD')

    assert results.size == 2

    book.status = 'READ'
    book.save

    results = Book.status('UNREAD')
    assert results.size == 1

    results = Book.status('READ')
    assert results.size == 1
  end

  test "image url exists but is not saved" do
    book = Book.new(title: 'Berta Isla', author: 'Javier Marias', image_url: 'TEST')
    book.save
    assert book.image_url == 'TEST'

    results = Book.status('UNREAD')
    assert_nil results[0].image_url
  end
end
