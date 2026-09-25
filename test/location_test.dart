// GRAFT Location Model Tests
// Tests for location model and Zimbabwe-specific handling

import 'package:flutter_test/flutter_test.dart';
import 'package:graft/models/location.dart';

void main() {
  group('Location Model Tests', () {
    test('Location can be created with coordinates', () {
      final location = Location(
        latitude: -17.8247,
        longitude: 31.0354,
        city: 'Harare',
        suburb: 'Borrowdale',
        area: 'Avondale Shopping Centre',
        address: '123 Main Street',
      );

      expect(location.latitude, -17.8247);
      expect(location.longitude, 31.0354);
      expect(location.city, 'Harare');
      expect(location.suburb, 'Borrowdale');
      expect(location.area, 'Avondale Shopping Centre');
      expect(location.address, '123 Main Street');
    });

    test('Location can be created with minimal fields', () {
      const location = Location(
        city: 'Bulawayo',
      );

      expect(location.city, 'Bulawayo');
      expect(location.latitude, null);
      expect(location.longitude, null);
    });

    test('Location hasCoordinates returns correct value', () {
      final withCoords = Location(latitude: -17.8247, longitude: 31.0354);
      final withoutCoords = Location(city: 'Harare');

      expect(withCoords.hasCoordinates, true);
      expect(withoutCoords.hasCoordinates, false);
    });

    test('Location copyWith updates specified fields', () {
      final location = Location(
        latitude: -17.8247,
        longitude: 31.0354,
        city: 'Harare',
      );

      final updated = location.copyWith(city: 'Bulawayo');

      expect(updated.latitude, location.latitude);
      expect(updated.longitude, location.longitude);
      expect(updated.city, 'Bulawayo');
    });

    test('Location toJson produces correct map', () {
      final location = Location(
        latitude: -17.8247,
        longitude: 31.0354,
        city: 'Harare',
      );

      final json = location.toJson();

      expect(json['latitude'], -17.8247);
      expect(json['longitude'], 31.0354);
      expect(json['city'], 'Harare');
    });

    test('Location fromJson deserializes correctly', () {
      final json = {
        'latitude': -20.0,
        'longitude': 29.0,
        'city': 'Mutare',
        'suburb': 'City Centre',
      };

      final location = Location.fromJson(json);

      expect(location.latitude, -20.0);
      expect(location.longitude, 29.0);
      expect(location.city, 'Mutare');
      expect(location.suburb, 'City Centre');
    });

    test('Location displayLocation handles null fields', () {
      final location = Location(city: 'Harare');
      expect(location.displayLocation, 'Harare');

      final fullLocation = Location(
        city: 'Harare',
        suburb: 'Borrowdale',
        area: 'Shopping Centre',
        address: '123 Main St',
      );
      expect(fullLocation.displayLocation, contains('Borrowdale'));
    });
  });

  group('Zimbabwe Location Tests', () {
    test('Major Zimbabwe cities can be represented', () {
      final cities = [
        {'name': 'Harare', 'lat': -17.8247, 'lng': 31.0354},
        {'name': 'Bulawayo', 'lat': -20.1105, 'lng': 29.8433},
        {'name': 'Mutare', 'lat': -20.0150, 'lng': 31.0250},
        {'name': 'Masvingo', 'lat': -20.1478, 'lng': 30.0859},
        {'name': 'Gweru', 'lat': -20.2500, 'lng': 29.8167},
      ];

      for (final city in cities) {
        final location = Location(
          city: city['name'] as String,
          latitude: (city['lat'] as num).toDouble(),
          longitude: (city['lng'] as num).toDouble(),
        );

        expect(location.city, city['name']);
        expect(location.hasCoordinates, true);
      }
    });
  });
}