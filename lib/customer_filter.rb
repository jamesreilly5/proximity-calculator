require_relative './distance_utils'

class CustomerFilter
  OFFICE_LAT = 53.3381985
  OFFICE_LON = -6.2592576

  def self.proximity(data, allowed_distance)
    data.reject do |customer|
      outside_range?(customer, allowed_distance)
    end
  end

  def self.sort_by_id(array, descending)
    sorted_array = array.sort_by { |hash| hash[:user_id].to_i }
    descending ? sorted_array.reverse : sorted_array
  end

  def self.outside_range?(customer, distance)
    customer_lat = Float(customer[:latitude])
    customer_lon = Float(customer[:longitude])
    DistanceUtils.calculate_distance(
      OFFICE_LAT, OFFICE_LON, customer_lat, customer_lon
    ) > distance
  end

  private_class_method :outside_range?
end
