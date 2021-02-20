module RestaurantsHelper
  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17&key="
  end
  def street_view(center)
    "https://maps.googleapis.com/maps/api/streetview?size=400x400&location=#{center}
    &fov=80&heading=0&pitch=0
    &key="
  end
end
