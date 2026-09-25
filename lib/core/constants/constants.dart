// GRAFT Constants
// Contains all constant values for the GRAFT application

import '../../models/enums/user_role.dart';
import '../../models/enums/verification_status.dart';

class AppConstants {
  // Application Info
  static const String appName = 'GRAFT';
  static const String appTagline = 'Find Work. Get Work.';

  // Zimbabwe-Specific Constants
  static const String defaultCountry = 'ZW';
  static const String defaultCountryCode = '+263';
  static const List<String> supportedCurrencies = ['USD', 'ZWL'];

  // Default Values
  static const String defaultCurrency = 'USD';
  static const UserRole defaultUserRole = UserRole.customer;
  static const VerificationStatus defaultVerificationStatus = VerificationStatus.unverified;

  // API Endpoints (placeholders for future implementation)
  static const String apiBaseUrl = 'https://api.graft.co.zw';
  static const String apiVersion = '/v1';

  // ENV
  static const String envDevelopment = 'development';
  static const String envProduction = 'production';
  static const String envStaging = 'staging';

  // Timeouts (in seconds)
  static const int apiTimeout = 30;
  static const int animationDuration = 300;

  // Limit Values
  static const int maxDescriptionLength = 500;
  static const int maxTitleLength = 100;
}