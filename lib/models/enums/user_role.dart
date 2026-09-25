// GRAFT User Role Enum
// Defines the core user roles for the GRAFT marketplace

enum UserRole {
  customer,
  worker,
  admin;

  String get label {
    switch (this) {
      case UserRole.customer:
        return 'Customer';
      case UserRole.worker:
        return 'Worker';
      case UserRole.admin:
        return 'Admin';
    }
  }

  String get description {
    switch (this) {
      case UserRole.customer:
        return 'Looking for work done';
      case UserRole.worker:
        return 'Looking for work opportunities';
      case UserRole.admin:
        return 'Platform administrator';
    }
  }
}