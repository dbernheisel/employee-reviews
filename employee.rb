class Employee

  attr_reader :salary
  attr_reader :name
  attr_reader :reviews

  def initialize(name: name, salary: salary, reviews: reviews = [], performance: performance)
    @salary = salary
    @name = name
    @reviews = reviews
    @performance = performance
  end

  def raise_salary(percent: percent = 0, amount: amount = 0)

  end

  def add_review(review)

  end


end
