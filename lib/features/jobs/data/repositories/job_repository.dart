// GRAFT Job Repository
// High-level interface for job operations
// Provides clean separation between UI and data layer

import '../datasources/job_data_source.dart';
import '../../../../models/job.dart';
import '../../../../models/location.dart';

/// Radius filter for nearby jobs
class RadiusFilter {
  final double radiusKm;
  final Location? workerLocation;

  const RadiusFilter({
    this.radiusKm = 10,
    this.workerLocation,
  });

  /// Convert radius from km to meters
  double get radiusMeters => radiusKm * 1000;

  /// Filter jobs by proximity to worker location
  bool includes(Job job) {
    if (workerLocation == null || !job.hasLocation) return true;
    final distanceMeters = job.location!.calculateDistanceTo(workerLocation!);
    return distanceMeters <= radiusMeters;
  }
}

/// Sort option for nearby jobs
enum JobSortOption {
  nearestFirst,
  furthestLast,
}

/// Extension on Job for distance-based sorting
extension JobSortingExtension on Job {
  /// Get distance from a reference location (in km)
  double? getDistanceFrom(Location reference) {
    if (!hasLocation) return null;
    return location!.calculateDistanceTo(reference) / 1000;
  }
}

/// JobRepository
/// Main interface for job-related operations
/// The UI layer should depend on this abstraction, not on the data source directly
class JobRepository {
  final JobDataSource _dataSource;

  JobRepository(this._dataSource);

  /// Get all jobs for a customer
  Future<List<Job>> getCustomerJobs(String customerId) {
    return _dataSource.getJobsByCustomer(customerId);
  }

  /// Get a specific job by ID
  Future<Job?> getJobById(String id) {
    return _dataSource.getJobById(id);
  }

  /// Create a new job
  Future<Job> createJob(JobDraft draft) async {
    final jobId = _dataSource is InMemoryJobDataSource
        ? (_dataSource as InMemoryJobDataSource).generateJobId()
        : 'job_${DateTime.now().millisecondsSinceEpoch}';

    final job = draft.toJob(jobId);
    await _dataSource.saveJob(job);
    return job;
  }

  /// Update an existing job
  Future<void> updateJob(Job job) async {
    await _dataSource.updateJob(job);
  }

  /// Delete a job
  Future<void> deleteJob(String id) async {
    await _dataSource.deleteJob(id);
  }

  /// Publish a job (change status from DRAFT to POSTED)
  Future<Job> publishJob(JobDraft draft) async {
    final job = await createJob(draft);
    final publishedJob = job.copyWith(
      status: JobStatus.posted,
      updatedAt: DateTime.now(),
    );
    await _dataSource.saveJob(publishedJob);
    return publishedJob;
  }

  /// Check if a job exists
  Future<bool> jobExists(String id) async {
    final job = await _dataSource.getJobById(id);
    return job != null;
  }

  /// Get jobs near a worker's location with radius filtering and sorting
  Future<List<Job>> getNearbyJobs({
    required Location? workerLocation,
    double radiusKm = 10,
    JobSortOption sort = JobSortOption.nearestFirst,
  }) async {
    final allJobs = await _dataSource.getAllJobs();

    // Filter by radius
    final filteredJobs = allJobs.where((job) {
      if (workerLocation == null || !job.hasLocation) return true;
      final distanceMeters = job.location!.calculateDistanceTo(workerLocation);
      return distanceMeters <= radiusKm * 1000;
    }).toList();

    // Sort by proximity when a worker location is available
    if (workerLocation != null) {
      sortByProximity(filteredJobs, workerLocation, sort);
    }

    return filteredJobs;
  }

  /// Sort jobs by proximity to a worker location
  void sortByProximity(List<Job> jobs, Location workerLocation, JobSortOption sort) {
    jobs.sort((a, b) {
      final aHasLoc = a.hasLocation;
      final bHasLoc = b.hasLocation;

      // Jobs without location go to the end
      if (!aHasLoc && !bHasLoc) return 0;
      if (!aHasLoc) return 1;
      if (!bHasLoc) return -1;

      final aDistance = a.location!.calculateDistanceTo(workerLocation);
      final bDistance = b.location!.calculateDistanceTo(workerLocation);

      if (sort == JobSortOption.nearestFirst) {
        return aDistance.compareTo(bDistance);
      } else {
        return bDistance.compareTo(aDistance);
      }
    });
  }
}

/// Service locator for dependency injection
/// This is a simple implementation for MVP
class ServiceLocator {
  static JobRepository? _jobRepository;
  static InMemoryJobDataSource? _dataSource;

  /// Get the job repository instance
  static JobRepository get jobRepository {
    if (_jobRepository == null) {
      _dataSource = InMemoryJobDataSource();
      _jobRepository = JobRepository(_dataSource!);
    }
    return _jobRepository!;
  }

  /// Reset the service locator (useful for testing)
  static void reset() {
    _dataSource?.reset();
    _jobRepository = null;
  }

  /// Get the data source directly (for testing)
  static InMemoryJobDataSource get dataSource =>
      _dataSource ??= InMemoryJobDataSource();
}