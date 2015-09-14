require 'byebug'
class Employee

  attr_reader :name
  attr_reader :salary
  attr_reader :reviews
  attr_reader :performance
  attr_reader :sentiment_avg
  attr_reader :email
  attr_reader :phone

  def initialize( name:,
                  salary:,
                  reviews: [],
                  email: "",
                  phone: "")
    @salary = salary
    @name = name
    @reviews = reviews
    @email = email
    @phone = phone
    @sentiment_avg = 0
    reviews.each { |r| self.add_review(r) }
  end

  def change_salary(percent: 0.0, adjust_amount: 0.0)
    raise ArgumentError "Need a percent OR amount" if percent == 0.0 && adjust_amount == 0.0
    raise ArgumentError "Provided both arguments, but can only take one" if percent != 0.0 && adjust_amount != 0.0
    unless percent == 0.0
      @salary += (@salary * (percent / 100.0))
    else
      @salary += adjust_amount
    end
  end

  def add_review(review)
    @reviews << review
    @performance = review.sentiment_rating
    sentiments = @reviews.collect { |r| r.sentiment_rating }
    @sentiment_avg = sentiments.reduce{ |sum, r| sum + r }.to_f / @reviews.length
  end


end
