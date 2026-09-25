// GRAFT User Model
// Represents a user in the GRAFT marketplace

import 'enums/user_role.dart';
import 'enums/verification_status.dart';
import 'location.dart';

class User {
  final String id;
  final String name;
  final String phoneNumber;
  final UserRole role;
  final String? profileImageUrl;
  final Location? location;
  final VerificationStatus verificationStatus;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    this.profileImageUrl,
    this.location,
    this.verificationStatus = VerificationStatus.unverified,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  User copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    UserRole? role,
    String? profileImageUrl,
    Location? location,
    VerificationStatus? verificationStatus,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      role: role ?? this.role,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      location: location ?? this.location,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      role: UserRole.values[json['role'] as int],
      profileImageUrl: json['profileImageUrl'] as String?,
      location: json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      verificationStatus: VerificationStatus.values[json['verificationStatus'] as int],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'role': role.index,
      'profileImageUrl': profileImageUrl,
      'location': location?.toJson(),
      'verificationStatus': verificationStatus.index,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}