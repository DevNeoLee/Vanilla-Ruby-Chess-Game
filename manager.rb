require_relative "employee"

class Manager < Employee
    attr_reader :employees
   def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employees(employee)
        @employees << employee
    end

    def bonus(multiplier)
        total = 0
        people = [self]
        until people.empty?
            person = people.shift
            if person == self 
                people += self.employees
            else 
                total += person.salary
                if person.class == Manager
                    people += person.employees
                end
            end
        end
        total * multiplier
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna","TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

ned.add_employees(darren)
darren.add_employees(shawna)
darren.add_employees(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
