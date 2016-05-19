require_relative '../customer_filter'
require_relative '../file_reader'

namespace :customer_proximity do
  desc 'Filters a stored list of customers by proximity to a hard coded location'
  task :find_users_within_100_km do
    file = FileReader.read("#{File.expand_path('../../../', __FILE__)}/customer_test_file.txt")
    customers_within_100_km = CustomerFilter.proximity(file, 100)
    sorted_customers = CustomerFilter.sort_by_id(customers_within_100_km, false)
    puts sorted_customers
  end
end
