module RestaurantsHelper
  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17&key=" + Rails.application.credentials.maps_api
  end
  def street_view(center)
    "https://maps.googleapis.com/maps/api/streetview?size=400x400&location=#{center}
    &fov=80&heading=0&pitch=0
    &key=" + Rails.application.credentials.maps_api
  end
  def current_location
    ip = request.remote_ip
    query = Geocoder.search(ip)
    puts("!!!!!!!: " + query.first.coordinates.to_s)
    query.first.coordinates
  end
end
