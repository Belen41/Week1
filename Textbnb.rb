class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

def array_printer(array)
  array.each do | home |
    puts "Name: #{home.name} |  City: #{home.city} |  Number of PAX: #{home.capacity} | Price: #{home.price}"
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Belen's place", "Leon", 10, 65),
  Home.new("Dani's place", "Cadiz", 5, 55),
  Home.new("Miriam's place", "Santander", 4, 52),
  Home.new("Monica's place", "Cartagena",5, 48),
  Home.new("William's place", "New York", 3, 50),
  Home.new("Marta's place", "Santander", 5, 60)
  ]

homes.each {|hm|
  puts hm.name, "Price: $#{hm.price} a night"
}

# User ordering options: from highest to lowest price, capacity or from lowest to highest price
def ordering_options
  puts "Please choose an ordering criteria (PAX, lowest price or highest price)"
  user_order_option=gets.chomp
    if user_order_option == "PAX"
      sorted_by_capacity = homes.sort do |a, b|
        a.capacity<=>b.capacity
      end
      puts "Here are the homes ordered by capacity:"
      array_printer(sorted_by_capacity)
    elsif user_order_option == "highest price"
      sorted_by_highest_price = homes.sort do |a, b|
        b.price<=>a.price
      end
      puts "Here are the homes ordered from highest to lowest price:"
      array_printer(sorted_by_highest_price)
    else sorted_by_lowest_price = homes.sort do |a, b| 
        a.price <=> b.price
      end
      puts "Here are the homes ordered from lowest to highest price:"
      array_printer(sorted_by_lowest_price)
    end
end

#Homes in selected city

puts "What is your city?"
user_city = gets.chomp

homes_in_user_city= homes.select do |hm|
  hm.city == user_city
end

puts "Here are the homes in your city:"
array_printer(homes_in_user_city)

total_prices=homes_in_user_city.reduce(0.0) do |sum,hm|
  sum + hm.price
end
puts "The average price for your selected homes is: "
puts total_prices/homes_in_user_city.length

puts "What price are you looking for?"
desired_price=gets.chomp
homes_in_price = []
homes_in_price.push(homes_in_user_city.find { |hm| hm.price.to_s == desired_price } )

puts "Here are the homes on your price:" 
array_printer(homes_in_price)