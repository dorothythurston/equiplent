class ItemSearcher
  def initialize(query)
    @query = query
  end

  def results
    if @query
      find_item
    else
      Item.none
    end
  end

  private

  attr_reader :query

  def find_item
    Item.where(
      "name ilike :query OR category ilike :query OR description ilike :query",
      query: fuzzy_query
    ).distinct
  end

  def fuzzy_query
    "%#{query}%"
  end
end
