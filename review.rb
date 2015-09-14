require 'date'
require './sentiment_words'

class Review
  attr_reader :review
  attr_reader :date
  attr_reader :sentiment_rating

  # rating should be -1 for negative, 0 for neutral, 1 for positive
  def initialize(review:, date: DateTime.new, bias: 0)
    @review = review
    @date = date
    self.get_sentiment(review, bias)
  end

  def get_sentiment(review_text, bias = 0)
    sentiment_total = 0.0
    review_text.split.each do |word|
      sentiment_value = sentiment_words[word.downcase.to_sym]
      sentiment_total += sentiment_value if sentiment_value
    end
    @sentiment_rating = sentiment_total + bias #seems there's a bias
  end

end
