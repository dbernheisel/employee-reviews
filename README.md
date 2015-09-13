# Employee Reviews Classes for Ruby

## Description
Two ruby classes that may help facilitate employee/department reviews, and performance-based raises. There is a test suite included that may help illustrate how to use the classes.

## Usage
Create an Employee object:
```ruby
david = Employee.new("David", 50_000)
```

Add a performance review to David's record:
```ruby
david.add_review(Review.new("Superb human being"))
```

Give David a raise:
```ruby
david.change_salary(percent: 0.20) # 20% raise
# or
david.change_salary(amount: 10_000) # $10,000 raise
```

Put David into the Department of Insanely beautiful people:
```ruby
super_beauts = Department.new("Insanely Beautiful People")
super_beauts.add_employee(david)
super_beauts.total_salary # => 60000
```

Give everyone a un-raise in the Insanely Beautiful People department:
```ruby
super_beauts.change_salary(percent: -0.20)
super_beauts.total_salary # => 48000
# it's hard being beautiful.
```


## Estimates

- Expect 1 hour of planning.
- Expect 4 hours of coding.
  - 1 hour for Part 1
  - 2 hours for Part 2
  - 1 hour for Part 3
- Expect 4 hours of more coding.
  - 2 hours to refactor
  - 2 hours to add Hard/Nightmore mode


