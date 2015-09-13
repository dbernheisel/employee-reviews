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
    Employee.new(name: "Blake", salary: 40001, phone: "321", email: "blake@test.com")
  end

  def negative_review_one
    Review.new("Zeke is a very positive person and encourages those around him, but he has not done well technically this year.  There are two areas in which Zeke has room for improvement.  First, when communicating verbally (and sometimes in writing), he has a tendency to use more words than are required.  This conversational style does put people at ease, which is valuable, but it often makes the meaning difficult to isolate, and can cause confusion.

Second, when discussing new requirements with project managers, less of the information is retained by Zeke long-term than is expected.  This has a few negative consequences: 1) time is spent developing features that are not useful and need to be re-run, 2) bugs are introduced in the code and not caught because the tests lack the same information, and 3) clients are told that certain features are complete when they are inadequate.  This communication limitation could be the fault of project management, but given that other developers appear to retain more information, this is worth discussing further.")
  end

  def negative_review_two
    Review.new("Thus far, there have been two concerns over Yvonne's performance, and both have been discussed with her in internal meetings.  First, in some cases, Yvonne takes longer to complete tasks than would normally be expected.  This most commonly manifests during development on existing applications, but can sometimes occur during development on new projects, often during tasks shared with Andrew.  In order to accommodate for these preferences, Yvonne has been putting more time into fewer projects, which has gone well.

Second, while in conversation, Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement.  In client meetings, she also can dwell on potential issues even if the client or other attendees have clearly ruled the issue out, and can sometimes get off topic.")
  end

  def positive_review_one
    Review.new("Xavier is a huge asset to SciMed and is a pleasure to work with.  He quickly knocks out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have to go

Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months, he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
  end

  def positive_review_two
    Review.new("Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with her work, developers are impressed with her productivity, and she's more than willing to help others even when she has a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.  During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread her effectiveness to other projects.")
  end

  def test_new_employee
    david_employee = david
    assert_raises(ArgumentError) { Employee.new }
    assert_raises(ArgumentError) { Employee.new(name: "David") }
    assert_raises(ArgumentError) { Employee.new(salary: 10000) }
    assert david_employee
    assert_equal david_employee.class, Employee
    assert_equal david_employee.name, "David"
    assert_equal david_employee.salary, 40000
    assert_equal david_employee.email, "david@test.com"
    assert_equal david_employee.phone, "123"
  end

  def test_new_department
    dept = Department.new(name: "Hard Knocks")
    assert_equal dept.name, "Hard Knocks"
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

  def test_raise_employee_salary
    david_employee = david
    assert david_employee.change_salary(percent: 10)
    assert_equal david_employee.salary, 44000
    assert david_employee.change_salary(adjust_amount: 1)
    assert_equal david_employee.salary, 44001
  end

  def test_unraise_employee_salary
    david_employee = david
    assert david_employee.change_salary(percent: -10)
    assert_equal david_employee.salary, 36000
    assert david_employee.change_salary(adjust_amount: -1)
    assert_equal david_employee.salary, 35999
  end

  def test_raise_department_salary
    david_employee = david
    blake_employee = blake
    dept = Department.new(name: "Hard Knocks", employees: [david_employee, blake_employee])
    dept.change_salary(percent: 100)
    assert_equal david_employee.salary, 80_000
    assert_equal blake_employee.salary, 80_002
    assert_equal dept.total_salary, 160_002
    dept.change_salary(adjust_amount: 2)
    assert_equal david_employee.salary, 80_001
    assert_equal blake_employee.salary, 80_003
    assert_equal dept.total_salary, 160_004
  end

    def test_unraise_department_salary
    david_employee = david
    blake_employee = blake
    dept = Department.new(name: "Hard Knocks", employees: [david_employee, blake_employee])
    dept.change_salary(percent: -50)
    assert_equal david_employee.salary, 20_000
    assert_equal blake_employee.salary, 20_001.50
    assert_equal dept.total_salary, 40_001.50
    dept.change_salary(adjust_amount: -2)
    assert_equal david_employee.salary, 19_999
    assert_equal blake_employee.salary, 20_000.50
    assert_equal dept.total_salary, 39_999.50
  end


end
