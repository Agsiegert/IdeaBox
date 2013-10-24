
class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id, :tag, :uploads

  def initialize(attributes = {})
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @uploads = attributes["uploads"]
    @tag =attributes["tag"] || 0
  end

  def save
    IdeaStore.create(to_h)
  end

  def <=>(other)
    other.rank <=> rank
  end

  def like!
    @rank += 1
  end

  def to_h
    {
      "title" => title,
      "description" => description,
      "rank" => rank,
      "uploads" => uploads,
      "tag" => tag
    }
  end
end
