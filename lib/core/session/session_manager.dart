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
  }

  /// Set the worker session
  void setWorkerSession(String workerId) {
    _workerId = workerId;
    _role = UserRole.worker;
    _customerId = null;
  }

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
  }
}