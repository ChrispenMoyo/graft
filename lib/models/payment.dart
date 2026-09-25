// GRAFT Payment Model
// Represents payment information for jobs
// Designed to support EcoCash as the MVP payment provider

enum PaymentProvider {
  ecocash('EcoCash'),
  mobileMoney('Mobile Money'),
  bankTransfer('Bank Transfer'),
  cash('Cash');

  const PaymentProvider(this.label);

  final String label;

  @override
  String toString() => label;
}

enum PaymentStatus {
  pending('Pending'),
  processing('Processing'),
  completed('Completed'),
  failed('Failed'),
  cancelled('Cancelled'),
  refunded('Refunded');

  const PaymentStatus(this.label);

  final String label;

  @override
  String toString() => label;
}

class Payment {
  final String id;
  final String jobId;
  final String payerId;
  final String recipientId;
  final double amount;
  final String currency;
  final PaymentProvider provider;
  final PaymentStatus status;
  final String? reference;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Payment({
    required this.id,
    required this.jobId,
    required this.payerId,
    required this.recipientId,
    required this.amount,
    required this.currency,
    required this.provider,
    this.status = PaymentStatus.pending,
    this.reference,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Payment copyWith({
    String? id,
    String? jobId,
    String? payerId,
    String? recipientId,
    double? amount,
    String? currency,
    PaymentProvider? provider,
    PaymentStatus? status,
    String? reference,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Payment(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      payerId: payerId ?? this.payerId,
      recipientId: recipientId ?? this.recipientId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      provider: provider ?? this.provider,
      status: status ?? this.status,
      reference: reference ?? this.reference,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] as String,
      jobId: json['jobId'] as String,
      payerId: json['payerId'] as String,
      recipientId: json['recipientId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      provider: PaymentProvider.values[json['provider'] as int],
      status: PaymentStatus.values[json['status'] as int],
      reference: json['reference'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobId': jobId,
      'payerId': payerId,
      'recipientId': recipientId,
      'amount': amount,
      'currency': currency,
      'provider': provider.index,
      'status': status.index,
      'reference': reference,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Payment && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}