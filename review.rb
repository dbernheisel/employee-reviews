require 'date'

class Review
  attr_reader :review
  attr_reader :date
  attr_reader :sentiment_rating

  def initialize(review: review, date: date = DateTime.new, rating: rating = nil)
    @review = review
    @date = date
    @rating = rating
    self.rate_review unless rating
  end

  def rate_review

  end

end
