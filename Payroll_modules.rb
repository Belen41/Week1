class Employee
    attr_reader :name, :email
    def initialize( name, email )
      @name = name
      @email = email
    end
    def show_salary
    	print "#{name}'s raw weekly salary is #{calculate_salary.round(2)} and the net one is #{calculate_net_salary.round(2)}."
	end
	def calculate_net_salary
		calculate_salary * 82/100
	end

end

module MonthlyPayable
	def calculate_salary
		weekly_wage2=@annual_salary / 52
	end
end
module HourlyPayable
def calculate_salary
		weekly_wage1=@price*@hours
	end
end

class HourlyEmployee < Employee
	def initialize( name, email, price, hours )
		super name, email 
		@price=price
		@hours=hours
	end
	include HourlyPayable 
end
class SalariedEmployee < Employee
	def initialize(name, email, annual_salary)
		super name, email
		@annual_salary=annual_salary
	end
	include MonthlyPayable
end

class Ted < SalariedEmployee
	def initialize(name, email, annual_salary, extra_price, total_hours )
		super name, email, annual_salary
		@extra_price= extra_price
		@total_hours= total_hours
		@annual_salary=annual_salary
		@extra_hours= @total_hours - 40
	end

	def calculate_salary
		(@total_hours > 40) ? total_payment_per_week= @annual_salary / 52 + (@extra_price * @extra_hours) : @annual_salary / 52
	end
end
class Payroll
    def initialize(employees)
        @employees = employees
    end
    def notify_employee (employee)
    	puts "\nEmail has been sent to #{employee.name} (#{employee.email})"
    end
    def pay_employees
    	@employees.each do |employee|
        employee.show_salary
        notify_employee(employee)
    	end
    end
end

nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
ted = Ted.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
dani = HourlyEmployee.new('Dani', 'daniemail@example.com', 15, 40)
belen = HourlyEmployee.new('Josh', 'belenemail@example.com', 15, 40)

employees = [ nizar, josh, ted, dani, belen ]
payroll=Payroll.new(employees)
payroll.pay_employees
