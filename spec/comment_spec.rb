require 'comment'

describe Comment do
  before do
    add_data_to_test_db
  end

  describe '::create' do
    it 'adds a comment to the database' do
      text, bookmark_id = 'First comment', '1'
      result = Comment.create(text, bookmark_id).first
      expect(result['id']).to eq "1"
      expect(result['text']).to eq text
      expect(result['bookmark_id']).to eq bookmark_id
    end
  end

  describe '::all' do
    before do
      add_data_to_comment_db
    end

    it 'returns an instance of Bookmark class' do
      comments = Comment.all
      expect(comments.first).to be_a Comment
      expect(comments.first.id).to eq '1'
      expect(comments.first.text).to eq 'First comment'
      expect(comments.first.bookmark_id).to eq '1'
    end
  end
end
