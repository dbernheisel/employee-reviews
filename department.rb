class Department

  attr_accessor :name
  attr_reader :employees

  def initialize(name:, employees: [])
    @name = name
    @employees = employees
  end

  def add_employee(employee)
    @employees << employee
  end

  def total_salary
    @employees.reduce(0) { |sum, e| sum += e.salary }
  end

  def change_salary(percent: 0, amount: 0, all: false)
    raise ArgumentError "Need a percent or amount" if percent == 0 && amount == 0

  end

end
