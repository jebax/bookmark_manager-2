require_relative "database_connection"

class Comment
  attr_reader :id, :text, :bookmark_id

  def self.create(text, bookmark_id)
    DatabaseConnection.query("INSERT INTO comments(text,bookmark_id)" \
      "VALUES ('#{text}','#{bookmark_id}') RETURNING id, text, bookmark_id;")
  end

  def self.all
    select_all.map do |comment|
      Comment.new(comment['id'], comment['text'], comment['bookmark_id'])
    end
  end

  def self.select_all
    DatabaseConnection.query("SELECT * FROM comments")
  end

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  private_class_method :select_all
end
