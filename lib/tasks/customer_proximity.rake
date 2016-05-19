require_relative '../customer_filter'
require_relative '../file_reader'

namespace :customer_proximity do
  desc 'Filters a stored list of customers by proximity to a hard coded location'
  task :find_users_within_100_km do
    distance = 100
    file = FileReader.read("#{File.expand_path('../../../', __FILE__)}/customer_test_file.txt")
    customers_within_100_km = CustomerFilter.proximity(file, distance)
    sorted_customers = CustomerFilter.sort_by_id(customers_within_100_km, false)

    puts "Sorted customers within #{distance}km of the office: "
    sorted_customers.each do |customer|
      puts "id: #{customer['user_id']}, name: #{customer['name']}"
    end
  end
end
