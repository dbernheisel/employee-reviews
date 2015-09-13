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
  end

  def change_salary(percent: percent = 0, amount: amount = 0)
    raise ArgumentError "Need a percent or amount" if percent == 0 && amount == 0

  end

  def add_review(review)
    @reviews << review
  end


end
