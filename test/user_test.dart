// GRAFT User Model Tests
// Tests for user model serialization and role handling

import 'package:flutter_test/flutter_test.dart';
import 'package:graft/models/user.dart';
import 'package:graft/models/enums/user_role.dart';
import 'package:graft/models/enums/verification_status.dart';
import 'package:graft/models/location.dart';

void main() {
  group('User Model Tests', () {
    test('User can be created with all fields', () {
      final user = User(
        id: 'user_123',
        name: 'John Doe',
        phoneNumber: '712345678',
        role: UserRole.customer,
        location: const Location(
          city: 'Harare',
          latitude: -17.8247,
          longitude: 31.0354,
        ),
        verificationStatus: VerificationStatus.verified,
      );

      expect(user.id, 'user_123');
      expect(user.name, 'John Doe');
      expect(user.phoneNumber, '712345678');
      expect(user.role, UserRole.customer);
      expect(user.verificationStatus, VerificationStatus.verified);
    });

    test('User copyWith updates specified fields', () {
      final user = User(
        id: 'user_123',
        name: 'John Doe',
        phoneNumber: '712345678',
        role: UserRole.customer,
      );

      final updated = user.copyWith(name: 'Jane Doe');

      expect(updated.id, user.id);
      expect(updated.name, 'Jane Doe');
      expect(updated.phoneNumber, user.phoneNumber);
    });

    test('User toJson produces correct map', () {
      final user = User(
        id: 'user_123',
        name: 'John Doe',
        phoneNumber: '712345678',
        role: UserRole.worker,
      );

      final json = user.toJson();

      expect(json['id'], 'user_123');
      expect(json['name'], 'John Doe');
      expect(json['phoneNumber'], '712345678');
      expect(json['role'], UserRole.worker.index);
    });

    test('User fromJson deserializes correctly', () {
      final json = {
        'id': 'user_456',
        'name': 'Jane Doe',
        'phoneNumber': '787654321',
        'role': UserRole.worker.index,
        'verificationStatus': VerificationStatus.verified.index,
        'createdAt': DateTime.now().toIso8601String(),
      };

      final user = User.fromJson(json);

      expect(user.id, 'user_456');
      expect(user.name, 'Jane Doe');
      expect(user.phoneNumber, '787654321');
      expect(user.role, UserRole.worker);
      expect(user.verificationStatus, VerificationStatus.verified);
    });

    test('User equality compares by id', () {
      final user1 = User(
        id: 'user_123',
        name: 'John Doe',
        phoneNumber: '712345678',
        role: UserRole.customer,
      );

      final user2 = User(
        id: 'user_123',
        name: 'Different Name',
        phoneNumber: '999999999',
        role: UserRole.worker,
      );

      expect(user1, equals(user2));
    });
  });

  group('User Role Tests', () {
    test('UserRole has correct labels', () {
      expect(UserRole.customer.label, 'Customer');
      expect(UserRole.worker.label, 'Worker');
      expect(UserRole.admin.label, 'Admin');
    });

    test('UserRole has correct descriptions', () {
      expect(UserRole.customer.description, 'Looking for work done');
      expect(UserRole.worker.description, 'Looking for work opportunities');
      expect(UserRole.admin.description, 'Platform administrator');
    });
  });

  group('Verification Status Tests', () {
    test('VerificationStatus has correct labels', () {
      expect(VerificationStatus.unverified.label, 'Unverified');
      expect(VerificationStatus.pending.label, 'Pending');
      expect(VerificationStatus.verified.label, 'Verified');
      expect(VerificationStatus.rejected.label, 'Rejected');
    });

    test('VerificationStatus can check if verified', () {
      expect(VerificationStatus.verified.isVerified, isTrue);
      expect(VerificationStatus.unverified.isVerified, isFalse);
    });

    test('VerificationStatus can check if pending', () {
      expect(VerificationStatus.pending.isPending, isTrue);
      expect(VerificationStatus.verified.isPending, isFalse);
    });
  });
}