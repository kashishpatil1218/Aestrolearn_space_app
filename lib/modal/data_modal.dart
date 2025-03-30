class SolarModel {
  String? gif, name, type, description;
  var distance_from_sun_km;
  var orbital_period_days;
  var diameter_km;
  var gravity_m_s2;
  var mass_kg;

  SolarModel({
    required this.name,
    required this.description,
    required this.diameter_km,
    required this.distance_from_sun_km,
    required this.gif,
    required this.gravity_m_s2,
    required this.mass_kg,
    required this.orbital_period_days,
    required this.type,
  });

  factory SolarModel.fromMap(Map m1) => SolarModel(
    name: m1['name'],
    description: m1['description'],
    diameter_km: m1['diameter_km'],
    distance_from_sun_km: m1['distance_from_sun_km'],
    gif: m1['gif'],
    gravity_m_s2: m1['gravity_m_s2'],
    mass_kg: m1['mass_kg'],
    orbital_period_days: m1['orbital_period_days'],
    type: m1['type'],
  );
}