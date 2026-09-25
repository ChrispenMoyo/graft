// GRAFT Verification Status Tests
// Tests for verification status enum handling

import 'package:flutter_test/flutter_test.dart';
import 'package:graft/models/enums/verification_status.dart';

void main() {
  group('Verification Status Tests', () {
    test('VerificationStatus enum has all required values', () {
      expect(VerificationStatus.unverified, isNotNull);
      expect(VerificationStatus.pending, isNotNull);
      expect(VerificationStatus.verified, isNotNull);
      expect(VerificationStatus.rejected, isNotNull);
    });

    test('VerificationStatus labels are correct', () {
      expect(VerificationStatus.unverified.label, 'Unverified');
      expect(VerificationStatus.pending.label, 'Pending');
      expect(VerificationStatus.verified.label, 'Verified');
      expect(VerificationStatus.rejected.label, 'Rejected');
    });

    test('VerificationStatus can check if verified', () {
      expect(VerificationStatus.verified.isVerified, isTrue);
      expect(VerificationStatus.unverified.isVerified, isFalse);
      expect(VerificationStatus.pending.isVerified, isFalse);
      expect(VerificationStatus.rejected.isVerified, isFalse);
    });

    test('VerificationStatus can check if pending', () {
      expect(VerificationStatus.pending.isPending, isTrue);
      expect(VerificationStatus.verified.isPending, isFalse);
      expect(VerificationStatus.unverified.isPending, isFalse);
      expect(VerificationStatus.rejected.isPending, isFalse);
    });

    test('VerificationStatus can check if canApplyForJobs', () {
      expect(VerificationStatus.verified.canApplyForJobs, isTrue);
      expect(VerificationStatus.pending.canApplyForJobs, isFalse);
      expect(VerificationStatus.unverified.canApplyForJobs, isFalse);
      expect(VerificationStatus.rejected.canApplyForJobs, isFalse);
    });

    test('VerificationStatus can be parsed from int', () {
      expect(VerificationStatus.values[0], equals(VerificationStatus.unverified));
      expect(VerificationStatus.values[1], equals(VerificationStatus.pending));
      expect(VerificationStatus.values[2], equals(VerificationStatus.verified));
      expect(VerificationStatus.values[3], equals(VerificationStatus.rejected));
    });

    test('VerificationStatus toString returns label', () {
      expect(VerificationStatus.verified.toString(), 'Verified');
      expect(VerificationStatus.unverified.toString(), 'Unverified');
    });
  });
}