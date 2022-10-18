// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationModel {
  final String? city;
  final String? zone;
  LocationModel({
    this.city,
    this.zone,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      city: json['city'] ?? '',
      zone: json['zone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['city'] = city;
    data['zone'] = zone;
    return data;
  }
}
