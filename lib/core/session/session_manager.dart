// GRAFT Session Manager
// Manages user session state across the application

import 'package:graft/models/enums/user_role.dart';

/// Manages the current user session
/// This is a simple implementation for MVP that can be enhanced later
class SessionManager {
  static SessionManager? _instance;

  String? _customerId;
  String? _workerId;
  UserRole? _role;

  /// Display name shown in greetings and on the profile. Optional -
  /// the user may never fill it in, and every screen must handle that.
  String? _displayName;

  /// Phone number captured at sign-in, e.g. "+263 771234567".
  String? _phoneNumber;

  /// When this session's account was created (used for "Member since").
  DateTime? _joinedAt;

  SessionManager._();

  static SessionManager get instance {
    _instance ??= SessionManager._();
    return _instance!;
  }

  /// Set the customer session
  void setCustomerSession(String customerId) {
    _customerId = customerId;
    _role = UserRole.customer;
    _workerId = null;
    _joinedAt ??= DateTime.now();
  }

  /// Set the worker session
  void setWorkerSession(String workerId) {
    _workerId = workerId;
    _role = UserRole.worker;
    _customerId = null;
    _joinedAt ??= DateTime.now();
  }

  /// Update profile details captured locally (name, phone).
  /// This is session-scoped for now; syncing to an account comes with
  /// the backend work in a later batch.
  void updateProfile({String? displayName, String? phoneNumber}) {
    if (displayName != null) _displayName = displayName;
    if (phoneNumber != null) _phoneNumber = phoneNumber;
  }

  /// The user's display name, if they have set one
  String? get displayName => _displayName;

  /// The phone number captured at sign-in, if any
  String? get phoneNumber => _phoneNumber;

  /// When this account was created
  DateTime get joinedAt => _joinedAt ??= DateTime.now();

  /// Get the current customer ID
  String get customerId {
    // Return a stable default ID if not set (for development)
    return _customerId ??=
        'customer_${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Get the current worker ID
  String? get workerId => _workerId;

  /// Get the ID of the user in the current session (customer or worker).
  /// Used as the owner ID for content created during this session.
  String get currentUserId => _workerId ?? customerId;

  /// Get the current user role
  UserRole? get role => _role;

  /// Check if a customer is logged in
  bool get isCustomer => _customerId != null;

  /// Check if a worker is logged in
  bool get isWorker => _workerId != null;

  /// Check if any user is logged in
  bool get isLoggedIn => _customerId != null || _workerId != null;

  /// Clear the session (logout)
  void clearSession() {
    _customerId = null;
    _workerId = null;
    _role = null;
    _displayName = null;
    _phoneNumber = null;
    _joinedAt = null;
  }
}