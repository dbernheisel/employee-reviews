class Employee

  attr_reader :name
  attr_reader :salary
  attr_reader :reviews
  attr_reader :performance
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
    reviews.each { |r| self.add_review(r) }
  end

  def change_salary(percent: 0, adjust_amount: 0)
    raise ArgumentError "Need a percent OR amount" if percent == 0 && adjust_amount == 0
    raise ArgumentError "Provided both arguments, but can only take one" if percent != 0 && adjust_amount != 0
    percent != 0 ?  @salary = @salary + (@salary * percent) : @salary += adjust_amount
    @salary
  end

  def add_review(review)
    @reviews << review
    @performance = review.rating
  end


end
