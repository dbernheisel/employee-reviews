#!/usr/bin/env ruby
require 'minitest/autorun'
require 'minitest/pride'
require './department'
require './employee'
require './review'

class EmployeeTest < Minitest::Test

  def david
    Employee.new(name: "David", salary: 40000, phone: "123", email: "david@test.com")
  end

  def blake
    Employee.new(name: "David", salary: 40001, phone: "321", email: "blake@test.com")
  end

  def test_new_employee
    david_employee = david
    assert david_employee
    assert_equal david_employee.class, Employee
    assert_equal david_employee.name, "David"
    assert_equal david_employee.salary, 40000
    assert_equal david_employee.email, "david@test.com"
    assert_equal david_employee.phone, "123"
  end

  def test_add_employee_to_department
    dept = Department.new(name: "Hard Knocks", employees: [david])
    assert dept
    refute_equal dept.employees.length, 2
    dept.add_employee(blake)
    assert_equal dept.employees.length, 2
  end

  def test_department_total_salary
    dept = Department.new(name: "Hard Knocks", employees: [david, blake])
    assert_equal david.salary, 40000
    assert_equal blake.salary, 40001
    assert_equal dept.total_salary, 80001
  end
end
