// GRAFT App Router
// Navigation configuration for the GRAFT application
// Implements the navigation structure for the two-sided marketplace

class AppRouter {
  // Route paths - Customer routes
  static const String customerShell = '/customer';
  static const String customerJobs = '/customer/jobs';
  static const String customerPostJob = '/customer/post-job';
  static const String customerNotifications = '/customer/notifications';
  static const String customerProfile = '/customer/profile';

  // Route paths - Worker routes
  static const String workerShell = '/worker';
  static const String workerNearbyJobs = '/worker/nearby-jobs';
  static const String workerActiveJobs = '/worker/active-jobs';
  static const String workerNotifications = '/worker/notifications';
  static const String workerProfile = '/worker/profile';

  // Common routes
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';

  // Route names for UI
  static const String onboardingName = 'Onboarding';
  static const String loginName = 'Login';
  static const String homeName = 'Home';

  // Customer route names
  static const String customerHomeName = 'Customer Home';
  static const String customerJobsName = 'My Jobs';
  static const String customerPostJobName = 'Post Job';
  static const String customerNotificationsName = 'Notifications';
  static const String customerProfileName = 'Profile';

  // Worker route names
  static const String workerHomeName = 'Worker Home';
  static const String workerNearbyJobsName = 'Nearby Jobs';
  static const String workerActiveJobsName = 'Active Jobs';
  static const String workerNotificationsName = 'Notifications';
  static const String workerProfileName = 'Profile';
}