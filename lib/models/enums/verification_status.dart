// GRAFT Verification Status Enum
// Defines verification states for workers (KYC foundation)

enum VerificationStatus {
  unverified,
  pending,
  verified,
  rejected;

  String get label {
    switch (this) {
      case VerificationStatus.unverified:
        return 'Unverified';
      case VerificationStatus.pending:
        return 'Pending';
      case VerificationStatus.verified:
        return 'Verified';
      case VerificationStatus.rejected:
        return 'Rejected';
    }
  }

  bool get isVerified => this == VerificationStatus.verified;
  bool get isPending => this == VerificationStatus.pending;
  bool get canApplyForJobs => this == VerificationStatus.verified;

  @override
  String toString() => label;
}