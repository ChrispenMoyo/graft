// GRAFT Job Model
// Represents a job posting in the GRAFT marketplace

import 'package:flutter/material.dart';
import 'location.dart';

/// Pricing preference for job budget
enum PricingPreference {
  /// Customer has a specific budget in mind
  fixedBudget,

  /// Customer is open to worker offers/bids
  openToOffers;

  String get label {
    switch (this) {
      case PricingPreference.fixedBudget:
        return 'Fixed Budget';
      case PricingPreference.openToOffers:
        return 'Open to Offers';
    }
  }

  String get description {
    switch (this) {
      case PricingPreference.fixedBudget:
        return 'I have a specific budget in mind';
      case PricingPreference.openToOffers:
        return "I'm open to worker offers";
    }
  }
}

/// Job status lifecycle
/// Batch 3 MVP: DRAFT -> POSTED
/// Later batches: POSTED -> BIDDING -> WORKER_SELECTED -> ...
enum JobStatus {
  /// Job is being created but not yet published
  draft,

  /// Job has been published and is visible to workers
  posted,

  /// Workers can submit bids (Batch 4/5 implementation)
  bidding,

  /// Worker has been selected by customer (Batch 4/5 implementation)
  workerSelected,

  /// Payment is pending (Batch 4/5 implementation)
  paymentPending,

  /// Payment has been confirmed (Batch 4/5 implementation)
  paymentConfirmed,

  /// Worker is on the way (Batch 4/5 implementation)
  workerEnRoute,

  /// Work has started (Batch 4/5 implementation)
  workStarted,

  /// Work has been completed by worker (Batch 4/5 implementation)
  workCompleted,

  /// Customer has confirmed completion (Batch 4/5 implementation)
  customerConfirmed,

  /// Payment has been released to worker (Batch 4/5 implementation)
  paymentReleased,

  /// Job is fully completed
  completed,

  /// Job was cancelled by customer or worker
  cancelled,

  /// Job expired (Batch 4/5 implementation)
  expired,

  /// Payment failed (Batch 4/5 implementation)
  paymentFailed,

  /// Job is under dispute (Batch 4/5 implementation)
  disputed;

  String get label {
    switch (this) {
      case JobStatus.draft:
        return 'Draft';
      case JobStatus.posted:
        return 'Posted';
      case JobStatus.bidding:
        return 'Bidding';
      case JobStatus.workerSelected:
        return 'Selected';
      case JobStatus.paymentPending:
        return 'Payment Pending';
      case JobStatus.paymentConfirmed:
        return 'Payment Confirmed';
      case JobStatus.workerEnRoute:
        return 'Worker En Route';
      case JobStatus.workStarted:
        return 'Work Started';
      case JobStatus.workCompleted:
        return 'Work Completed';
      case JobStatus.customerConfirmed:
        return 'Confirmed';
      case JobStatus.paymentReleased:
        return 'Payment Released';
      case JobStatus.completed:
        return 'Completed';
      case JobStatus.cancelled:
        return 'Cancelled';
      case JobStatus.expired:
        return 'Expired';
      case JobStatus.paymentFailed:
        return 'Payment Failed';
      case JobStatus.disputed:
        return 'Disputed';
    }
  }

  /// Check if this is a terminal/completed state
  bool get isCompleted =>
      this == JobStatus.completed ||
      this == JobStatus.cancelled ||
      this == JobStatus.expired ||
      this == JobStatus.disputed ||
      this == JobStatus.paymentFailed;

  /// Check if this is an active/in-progress state
  bool get isActive =>
      this == JobStatus.posted ||
      this == JobStatus.bidding ||
      this == JobStatus.workerSelected ||
      this == JobStatus.paymentPending ||
      this == JobStatus.paymentConfirmed ||
      this == JobStatus.workerEnRoute ||
      this == JobStatus.workStarted ||
      this == JobStatus.workCompleted ||
      this == JobStatus.customerConfirmed ||
      this == JobStatus.paymentReleased;
}

/// Maximum number of photos for a job (configurable limit)
const int maxJobPhotos = 5;

class Job {
  final String id;
  final String customerId;
  final String? workerId;
  final String title;
  final String description;
  final String category;
  final List<String> photos;
  final Location? location;
  final DateTime? preferredDate;
  final TimeOfDay? preferredTime;
  final double? budget;
  final PricingPreference pricingPreference;
  final String currency;
  final JobStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Job({
    required this.id,
    required this.customerId,
    this.workerId,
    required this.title,
    required this.description,
    required this.category,
    this.photos = const [],
    this.location,
    this.preferredDate,
    this.preferredTime,
    this.budget,
    this.pricingPreference = PricingPreference.openToOffers,
    this.currency = 'USD',
    this.status = JobStatus.posted,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Job copyWith({
    String? id,
    String? customerId,
    String? workerId,
    String? title,
    String? description,
    String? category,
    List<String>? photos,
    Location? location,
    DateTime? preferredDate,
    TimeOfDay? preferredTime,
    double? budget,
    PricingPreference? pricingPreference,
    String? currency,
    JobStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Job(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      workerId: workerId ?? this.workerId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      photos: photos ?? this.photos,
      location: location ?? this.location,
      preferredDate: preferredDate ?? this.preferredDate,
      preferredTime: preferredTime ?? this.preferredTime,
      budget: budget ?? this.budget,
      pricingPreference: pricingPreference ?? this.pricingPreference,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      workerId: json['workerId'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      photos: (json['photos'] as List<dynamic>?)?.cast<String>() ?? [],
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      preferredDate: json['preferredDate'] != null
          ? DateTime.parse(json['preferredDate'] as String)
          : null,
      preferredTime: json['preferredTime'] != null
          ? TimeOfDay(
              hour: json['preferredTime']['hour'] as int,
              minute: json['preferredTime']['minute'] as int,
            )
          : null,
      budget: json['budget'] != null ? (json['budget'] as num).toDouble() : null,
      pricingPreference:
          PricingPreference.values[json['pricingPreference'] as int? ?? 0],
      currency: json['currency'] as String? ?? 'USD',
      status: JobStatus.values[json['status'] as int],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'workerId': workerId,
      'title': title,
      'description': description,
      'category': category,
      'photos': photos,
      'location': location?.toJson(),
      'preferredDate': preferredDate?.toIso8601String(),
      'preferredTime':
          preferredTime != null ? {'hour': preferredTime!.hour, 'minute': preferredTime!.minute} : null,
      'budget': budget,
      'pricingPreference': pricingPreference.index,
      'currency': currency,
      'status': status.index,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// Check if job has location coordinates
  bool get hasLocation {
    return location?.hasCoordinates ?? false;
  }

  /// Get formatted budget string
  String get formattedBudget {
    if (budget == null) return 'Price on request';
    return '$currency ${budget!.toStringAsFixed(2)}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Job && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// JobDraft - Intermediate state during posting flow
/// Used to collect job information before publishing
class JobDraft {
  final String? id; // Generated on publish
  final String customerId;
  final String? workerId;
  final String? category;
  final String? title;
  final String? description;
  final List<String> photos;
  final Location? location;
  final DateTime? preferredDate;
  final TimeOfDay? preferredTime;
  final double? budget;
  final PricingPreference pricingPreference;
  final JobStatus status;
  final DateTime createdAt;

  JobDraft({
    this.id,
    required this.customerId,
    this.workerId,
    this.category,
    this.title,
    this.description,
    this.photos = const [],
    this.location,
    this.preferredDate,
    this.preferredTime,
    this.budget,
    this.pricingPreference = PricingPreference.openToOffers,
    this.status = JobStatus.draft,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  JobDraft copyWith({
    String? id,
    String? customerId,
    String? workerId,
    String? category,
    String? title,
    String? description,
    List<String>? photos,
    Location? location,
    DateTime? preferredDate,
    TimeOfDay? preferredTime,
    double? budget,
    PricingPreference? pricingPreference,
    JobStatus? status,
    DateTime? createdAt,
  }) {
    return JobDraft(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      workerId: workerId ?? this.workerId,
      category: category ?? this.category,
      title: title ?? this.title,
      description: description ?? this.description,
      photos: photos ?? this.photos,
      location: location ?? this.location,
      preferredDate: preferredDate ?? this.preferredDate,
      preferredTime: preferredTime ?? this.preferredTime,
      budget: budget ?? this.budget,
      pricingPreference: pricingPreference ?? this.pricingPreference,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Check if all required fields are filled
  bool get hasRequiredFields {
    return category != null &&
        category!.isNotEmpty &&
        title != null &&
        title!.isNotEmpty &&
        description != null &&
        description!.isNotEmpty &&
        location != null;
  }

  /// Check if location is valid
  bool get hasValidLocation {
    final loc = location;
    return loc != null && (loc.area != null || loc.hasCoordinates);
  }

  /// Create a Job from the draft
  Job toJob(String newId) {
    return Job(
      id: newId,
      customerId: customerId,
      workerId: workerId,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      photos: photos,
      location: location,
      preferredDate: preferredDate,
      preferredTime: preferredTime,
      budget: budget,
      pricingPreference: pricingPreference,
      status: JobStatus.posted,
      createdAt: createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobDraft && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, customerId, category, title);
}