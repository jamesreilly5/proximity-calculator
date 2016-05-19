class DistanceUtils
  EARTH_RAD_IN_KM = 6371.00

  # Using the haversine distance algorithm
  # rubocop:disable AbcSize
  def self.calculate(lat1, lon1, lat2, lon2)
    validate_params(lat1, lon1, lat2, lon2)

    lat_delta = to_rad(lat1 - lat2)
    lon_delta = to_rad(lon1 - lon2)

    a = Math.sin(lat_delta / 2)**2 + Math.cos(to_rad(lat1)) * Math.cos(to_rad(lat2)) * Math.sin(lon_delta / 2)**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    c * EARTH_RAD_IN_KM
  end
  # rubocop:enable AbcSize

  def self.to_rad(degrees)
    (degrees * Math::PI) / 180.0
  end

  def self.validate_params(lat1, lon1, lat2, lon2)
    valid_lat?(lat1) && valid_lon?(lon1) && valid_lat?(lat2) && valid_lon?(lon2)
  end

  def self.valid_lat?(lat)
    return true unless lat > 90 || lat < -90
    raise ArgumentError, "Latitude #{lat} is invalid"
  end

  def self.valid_lon?(lon)
    return true unless lon > 180 || lon < -180
    raise ArgumentError, "Longitude #{lon} is invalid"
  end

  private_class_method :validate_params, :valid_lat?, :valid_lon?
end
