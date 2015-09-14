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
david.change_salary(percent: 20) # 20% raise
# or
david.change_salary(adjust_amount: 10_000) # $10,000 raise
```

Put David into the Department of Insanely Beautiful People (the IBP):
```ruby
super_beauts = Department.new("Insanely Beautiful People")
super_beauts.add_employee(david)
super_beauts.total_salary # => 60000
```

Give everyone a un-raise in the Insanely Beautiful People department:
```ruby
super_beauts.change_salary(percent: -20)
super_beauts.total_salary # => 48000
# it's hard being beautiful.
```

Add a review to someone with a bias
```ruby
david.add_review(review: "Super awesome", bias: 1.25)
# There is a sentiment parser that will determine the score of the review text.
# In this case, 0.75 is awarded. It's generally positive, and the bias of 1.25
# was added to the performance rating.
david.performance # => 2.0
```

Give everyone a raise based on performance scores:
```ruby
blake = Employee.new("Blake", 48_000)
super_beauts.add_employee(blake)
super_beauts.total_salary # => 96000
# Let's assume Blake's performance rating is 4.00 (4/6 = 0.666)
# David's performance rating is 2.00 (2/6 = 0.333)
super_beauts.change_salary(amount: 10, weight_by_score: true)
blake.salary # => 48006.67
david.salary # => 48003.33
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


