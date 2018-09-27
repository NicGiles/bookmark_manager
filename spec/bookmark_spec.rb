require 'bookmark'

describe Bookmark do


describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
    Bookmark.create(url: "http://www.google.com", title: 'Google')
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')

    bookmarks = Bookmark.all
    bookmark = Bookmark.all.first

    expect(bookmarks.length).to eq 3
    expect(bookmark).to be_a Bookmark
    expect(bookmark).to respond_to(:id)
    expect(bookmark.title).to eq 'Makers Academy'
    expect(bookmark.url).to eq 'http://www.makersacademy.com'
  end
end



describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

    bookmark = Bookmark.all.first

    expect(bookmark).to be_a Bookmark
    expect(bookmark).to respond_to (:id)
    expect(bookmark.title).to eq 'Test Bookmark'

  end
end

describe '.create' do
  it 'prevents an invalid new bookmark' do
    bookmark = Bookmark.create(url: 'hellloooo', title: 'not hellooo')
expect(bookmark).not_to be_a Bookmark


  end
end


end
