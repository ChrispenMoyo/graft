// GRAFT Job Model Tests
// Tests for job model serialization and currency handling

import 'package:flutter_test/flutter_test.dart';
import 'package:graft/models/job.dart';
import 'package:graft/models/location.dart';

void main() {
  group('Job Model Tests', () {
    test('Job can be created with required fields', () {
      final job = Job(
        id: 'job_123',
        customerId: 'customer_1',
        title: 'Gardening Service',
        description: 'Need someone to mow the lawn',
        category: 'Gardening',
      );

      expect(job.id, 'job_123');
      expect(job.customerId, 'customer_1');
      expect(job.title, 'Gardening Service');
      // Jobs default to the posted status
      expect(job.status, JobStatus.posted);
    });

    test('Job can be created with location', () {
      final job = Job(
        id: 'job_123',
        customerId: 'customer_1',
        title: 'Plumbing Repair',
        description: 'Need a plumber',
        category: 'Plumbing',
        location: const Location(
          latitude: -17.8247,
          longitude: 31.0354,
          area: 'Borrowdale',
        ),
        budget: 15.0,
        currency: 'USD',
      );

      expect(job.hasLocation, true);
      expect(job.location!.latitude, -17.8247);
      expect(job.location!.longitude, 31.0354);
      expect(job.formattedBudget, 'USD 15.00');
    });

    test('Job currency defaults to USD', () {
      final job = Job(
        id: 'job_123',
        customerId: 'customer_1',
        title: 'Test Job',
        description: 'Test',
        category: 'Other',
      );

      expect(job.currency, 'USD');
    });

    test('Job supports ZWL currency', () {
      final job = Job(
        id: 'job_123',
        customerId: 'customer_1',
        title: 'Test Job',
        description: 'Test',
        category: 'Other',
        currency: 'ZWL',
        budget: 150.0,
      );

      expect(job.currency, 'ZWL');
      expect(job.formattedBudget, 'ZWL 150.00');
    });

    test('Job toJson produces correct map', () {
      final job = Job(
        id: 'job_456',
        customerId: 'customer_2',
        title: 'Electrical Work',
        description: 'Fix electrical issues',
        category: 'Electrical',
        budget: 25.0,
        currency: 'ZWL',
      );

      final json = job.toJson();

      expect(json['id'], 'job_456');
      expect(json['customerId'], 'customer_2');
      expect(json['title'], 'Electrical Work');
      expect(json['currency'], 'ZWL');
      expect(json['status'], JobStatus.posted.index);
    });

    test('Job fromJson deserializes correctly', () {
      final json = {
        'id': 'job_789',
        'customerId': 'customer_3',
        'workerId': 'worker_1',
        'title': 'Cleaning Service',
        'description': 'Deep clean the house',
        'category': 'Cleaning',
        'budget': 100.0,
        'currency': 'USD',
        'status': 1,
        'createdAt': DateTime.now().toIso8601String(),
      };

      final job = Job.fromJson(json);

      expect(job.id, 'job_789');
      expect(job.customerId, 'customer_3');
      expect(job.workerId, 'worker_1');
      expect(job.title, 'Cleaning Service');
      expect(job.budget, 100.0);
      expect(job.status, JobStatus.posted);
    });
  });

  group('Job Status Tests', () {
    test('JobStatus has correct labels', () {
      expect(JobStatus.draft.label, 'Draft');
      expect(JobStatus.posted.label, 'Posted');
      expect(JobStatus.completed.label, 'Completed');
      expect(JobStatus.cancelled.label, 'Cancelled');
      expect(JobStatus.disputed.label, 'Disputed');
    });

    test('JobStatus active and completed helpers work', () {
      expect(JobStatus.posted.isActive, true);
      expect(JobStatus.bidding.isActive, true);
      expect(JobStatus.draft.isActive, false);

      expect(JobStatus.completed.isCompleted, true);
      expect(JobStatus.cancelled.isCompleted, true);
      expect(JobStatus.posted.isCompleted, false);
    });
  });

  group('Currency Handling Tests', () {
    test('Currency can be USD or ZWL', () {
      final usdJob = Job(
        id: 'job_usd',
        customerId: 'customer_1',
        title: 'Test',
        description: 'Test',
        category: 'Other',
        currency: 'USD',
      );

      final zwlJob = Job(
        id: 'job_zwl',
        customerId: 'customer_1',
        title: 'Test',
        description: 'Test',
        category: 'Other',
        currency: 'ZWL',
      );

      expect(usdJob.currency, 'USD');
      expect(zwlJob.currency, 'ZWL');
    });

    test('Budget without amount shows price on request', () {
      final job = Job(
        id: 'job_no_budget',
        customerId: 'customer_1',
        title: 'Test',
        description: 'Test',
        category: 'Other',
      );

      expect(job.formattedBudget, 'Price on request');
    });
  });

  group('JobDraft Tests', () {
    test('Draft knows when required fields are missing', () {
      final draft = JobDraft(customerId: 'customer_1');
      expect(draft.hasRequiredFields, false);

      final filled = draft.copyWith(
        category: 'Plumbing',
        title: 'Fix leaking tap',
        description: 'The kitchen tap is leaking and needs repair.',
        location: const Location(area: 'Mbare'),
      );
      expect(filled.hasRequiredFields, true);
    });

    test('Draft converts to a posted Job', () {
      final draft = JobDraft(
        customerId: 'customer_1',
        category: 'Plumbing',
        title: 'Fix leaking tap',
        description: 'The kitchen tap is leaking and needs repair.',
        location: const Location(area: 'Mbare'),
        budget: 20.0,
      );

      final job = draft.toJob('job_999');

      expect(job.id, 'job_999');
      expect(job.customerId, 'customer_1');
      expect(job.title, 'Fix leaking tap');
      expect(job.status, JobStatus.posted);
      expect(job.formattedBudget, 'USD 20.00');
    });
  });
}
