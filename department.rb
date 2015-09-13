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

  def total_salary(employees = @employees)
    employees.reduce(0) { |sum, e| sum += e.salary }
  end

  def change_salary(percent: 0.0, adjust_amount: 0.0, all: false )
    raise ArgumentError "Need a percent or amount" if percent == 0.0 && adjust_amount == 0.0
    raise ArgumentError "Provided both arguments, but can only take one" if percent != 0.0 && adjust_amount != 0.0

    employees = @employees
    employees = @employees.select { |e| e.performance > 0.50 } unless all

    unless adjust_amount == 0.0
      amount_each = adjust_amount / employees.length
      employees.each { |e| e.change_salary(adjust_amount: amount_each) }
    end

    employees.each { |e| e.change_salary(percent: percent) } unless percent == 0.0

  end

end
