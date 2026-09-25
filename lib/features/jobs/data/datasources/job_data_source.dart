// GRAFT Job Data Source
// Local data source for job persistence (MVP - in-memory implementation)

import '../../../../models/job.dart';

/// Abstract data source for jobs
abstract class JobDataSource {
  Future<List<Job>> getAllJobs();
  Future<List<Job>> getJobsByCustomer(String customerId);
  Future<Job?> getJobById(String id);
  Future<void> saveJob(Job job);
  Future<void> updateJob(Job job);
  Future<void> deleteJob(String id);
  Future<void> clearAllJobs();
}

/// In-memory data source implementation for MVP
/// This is a simple in-memory storage that can be replaced with
/// a proper database or remote API in later batches
class InMemoryJobDataSource implements JobDataSource {
  final List<Job> _jobs = [];
  int _nextId = 1;

  InMemoryJobDataSource();

  @override
  Future<List<Job>> getAllJobs() async {
    return List.from(_jobs);
  }

  @override
  Future<List<Job>> getJobsByCustomer(String customerId) async {
    return _jobs.where((job) => job.customerId == customerId).toList();
  }

  @override
  Future<Job?> getJobById(String id) async {
    try {
      return _jobs.firstWhere((job) => job.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveJob(Job job) async {
    final existingIndex = _jobs.indexWhere((j) => j.id == job.id);
    if (existingIndex >= 0) {
      _jobs[existingIndex] = job;
    } else {
      _jobs.add(job);
    }
  }

  @override
  Future<void> updateJob(Job job) async {
    await saveJob(job);
  }

  @override
  Future<void> deleteJob(String id) async {
    _jobs.removeWhere((job) => job.id == id);
  }

  @override
  Future<void> clearAllJobs() async {
    _jobs.clear();
  }

  /// Generate a unique job ID
  String generateJobId() {
    _nextId++;
    return 'job_$_nextId';
  }

  /// Reset the data source (useful for testing)
  void reset() {
    _jobs.clear();
    _nextId = 1;
  }
}