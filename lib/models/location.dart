// GRAFT Location Model
// Represents geographic locations in Zimbabwe

import 'dart:math';

class Location {
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? suburb;
  final String? area;
  final String? address;

  const Location({
    this.latitude,
    this.longitude,
    this.city,
    this.suburb,
    this.area,
    this.address,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
    String? city,
    String? suburb,
    String? area,
    String? address,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city,
      suburb: suburb ?? this.suburb,
      area: area ?? this.area,
      address: address ?? this.address,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
      city: json['city'] as String?,
      suburb: json['suburb'] as String?,
      area: json['area'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'suburb': suburb,
      'area': area,
      'address': address,
    };
  }

  bool get hasCoordinates {
    return latitude != null && longitude != null;
  }

  /// Calculate distance to another location in meters using Haversine formula
  double calculateDistanceTo(Location other) {
    const earthRadius = 6371000; // meters

    final lat1 = latitude ?? 0.0;
    final lat2 = other.latitude ?? 0.0;
    final deltaLat = ((other.latitude ?? 0.0) - (latitude ?? 0.0)) * pi / 180;
    final deltaLon = ((other.longitude ?? 0.0) - (longitude ?? 0.0)) * pi / 180;

    final a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1 * pi / 180) * cos(lat2 * pi / 180) *
            sin(deltaLon / 2) * sin(deltaLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  String get displayLocation {
    final parts = [city, suburb, area, address].whereType<String>().where((s) => s.isNotEmpty);
    return parts.isEmpty ? 'Location not specified' : parts.join(', ');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Location &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.city == city;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude, city);
}