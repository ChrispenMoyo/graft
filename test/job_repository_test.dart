// GRAFT Job Repository Tests
// Tests for job persistence, ownership, and nearby-job discovery

import 'package:flutter_test/flutter_test.dart';
import 'package:graft/features/jobs/data/datasources/job_data_source.dart';
import 'package:graft/features/jobs/data/repositories/job_repository.dart';
import 'package:graft/models/job.dart';
import 'package:graft/models/location.dart';

Job _makeJob({
  required String id,
  required String customerId,
  String title = 'Test Job',
  Location? location,
  JobStatus status = JobStatus.posted,
}) {
  return Job(
    id: id,
    customerId: customerId,
    title: title,
    description: 'A test job description',
    category: 'Plumbing',
    location: location,
    status: status,
  );
}

void main() {
  group('JobRepository Persistence Tests', () {
    late JobRepository repository;
    late InMemoryJobDataSource dataSource;

    setUp(() {
      dataSource = InMemoryJobDataSource();
      repository = JobRepository(dataSource);
    });

    test('publishJob creates and stores a posted job', () async {
      final draft = JobDraft(
        customerId: 'customer_1',
        category: 'Plumbing',
        title: 'Fix leaking tap',
        description: 'The kitchen tap is leaking and needs repair.',
        location: const Location(area: 'Mbare', city: 'Harare'),
      );

      final job = await repository.publishJob(draft);

      expect(job.status, JobStatus.posted);
      expect(job.customerId, 'customer_1');
      expect(job.title, 'Fix leaking tap');

      final stored = await repository.getJobById(job.id);
      expect(stored, isNotNull);
      expect(stored!.title, 'Fix leaking tap');
    });

    test('published jobs are returned for their owning customer only',
        () async {
      await repository.publishJob(JobDraft(
        customerId: 'customer_1',
        category: 'Plumbing',
        title: 'Fix leaking tap',
        description: 'The kitchen tap is leaking and needs repair.',
        location: const Location(area: 'Mbare'),
      ));
      await repository.publishJob(JobDraft(
        customerId: 'customer_2',
        category: 'Cleaning',
        title: 'Deep clean house',
        description: 'A full deep clean of a three room house.',
        location: const Location(area: 'Highfield'),
      ));

      final customer1Jobs = await repository.getCustomerJobs('customer_1');
      expect(customer1Jobs.length, 1);
      expect(customer1Jobs.first.title, 'Fix leaking tap');

      final customer2Jobs = await repository.getCustomerJobs('customer_2');
      expect(customer2Jobs.length, 1);
      expect(customer2Jobs.first.title, 'Deep clean house');
    });

    test('each created job gets a unique id', () async {
      final job1 = await repository.publishJob(JobDraft(
        customerId: 'customer_1',
        category: 'Plumbing',
        title: 'Fix leaking tap',
        description: 'The kitchen tap is leaking and needs repair.',
        location: const Location(area: 'Mbare'),
      ));
      final job2 = await repository.publishJob(JobDraft(
        customerId: 'customer_1',
        category: 'Plumbing',
        title: 'Fix leaking tap again',
        description: 'The kitchen tap is still leaking and needs repair.',
        location: const Location(area: 'Mbare'),
      ));

      expect(job1.id, isNot(job2.id));
    });

    test('deleteJob removes the job', () async {
      final job = await repository.publishJob(JobDraft(
        customerId: 'customer_1',
        category: 'Plumbing',
        title: 'Fix leaking tap',
        description: 'The kitchen tap is leaking and needs repair.',
        location: const Location(area: 'Mbare'),
      ));

      await repository.deleteJob(job.id);

      expect(await repository.getJobById(job.id), isNull);
    });
  });

  group('Nearby Jobs Discovery Tests', () {
    late JobRepository repository;
    late InMemoryJobDataSource dataSource;

    // Harare CBD reference point
    const harareCbd = Location(latitude: -17.8267, longitude: 31.0327);

    setUp(() {
      dataSource = InMemoryJobDataSource();
      repository = JobRepository(dataSource);
    });

    test('returns jobs with no coordinates (they stay discoverable)',
        () async {
      await dataSource.saveJob(_makeJob(
        id: 'job_area_only',
        customerId: 'customer_1',
        // Area-only location, no coordinates
        location: const Location(area: 'Mbare'),
      ));

      final jobs = await repository.getNearbyJobs(workerLocation: harareCbd);
      expect(jobs.length, 1);
      expect(jobs.first.id, 'job_area_only');
    });

    test('filters out jobs beyond the radius', () async {
      // ~5 km from Harare CBD
      await dataSource.saveJob(_makeJob(
        id: 'job_near',
        customerId: 'customer_1',
        location: const Location(latitude: -17.8600, longitude: 31.0300),
      ));
      // ~400 km away (Bulawayo area)
      await dataSource.saveJob(_makeJob(
        id: 'job_far',
        customerId: 'customer_1',
        location: const Location(latitude: -20.1500, longitude: 28.5833),
      ));

      final jobs = await repository.getNearbyJobs(
        workerLocation: harareCbd,
        radiusKm: 10,
      );

      final ids = jobs.map((j) => j.id).toSet();
      expect(ids, contains('job_near'));
      expect(ids, isNot(contains('job_far')));
    });

    test('sorts jobs nearest first', () async {
      // ~1.4 km from Harare CBD
      await dataSource.saveJob(_makeJob(
        id: 'job_medium',
        customerId: 'customer_1',
        location: const Location(latitude: -17.8400, longitude: 31.0350),
      ));
      // ~5 km from Harare CBD
      await dataSource.saveJob(_makeJob(
        id: 'job_far_nearby',
        customerId: 'customer_1',
        location: const Location(latitude: -17.8700, longitude: 31.0300),
      ));
      // ~0.5 km from Harare CBD
      await dataSource.saveJob(_makeJob(
        id: 'job_closest',
        customerId: 'customer_1',
        location: const Location(latitude: -17.8300, longitude: 31.0330),
      ));

      final jobs = await repository.getNearbyJobs(workerLocation: harareCbd);

      expect(jobs.map((j) => j.id).toList(),
          ['job_closest', 'job_medium', 'job_far_nearby']);
    });

    test('does not crash when worker location is null', () async {
      await dataSource.saveJob(_makeJob(
        id: 'job_1',
        customerId: 'customer_1',
        location: harareCbd,
      ));

      final jobs = await repository.getNearbyJobs(workerLocation: null);

      expect(jobs.length, 1);
    });
  });
}
