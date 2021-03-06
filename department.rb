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


  def change_salary(percent: 0.0, adjust_amount: 0.0, weight_by_score: false)
    raise ArgumentError "Need a percent or amount" if percent == 0.0 && adjust_amount == 0.0
    raise ArgumentError "Provided both arguments, but can only take one" if percent != 0.0 && adjust_amount != 0.0
    return nil if @employees.length < 1

    employees = []
    if block_given?
      employees = @employees.select { |e| yield e }
    else
      employees = @employees
    end


    unless adjust_amount == 0.0
      if weight_by_score
        performances = employees.collect { |e| e.performance }
        total_performance = performances.reduce { |sum, p| sum + p }.to_f
        employees.each { |e| e.change_salary(adjust_amount: e.performance/total_performance) }
      else
        amount_each = adjust_amount / employees.length
        employees.each { |e| e.change_salary(adjust_amount: amount_each) }
      end
    end

    employees.each { |e| e.change_salary(percent: percent) } unless percent == 0.0

  end


end
