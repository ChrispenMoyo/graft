// GRAFT App Configuration
// Application-wide configuration settings

class AppConfig {
  static const String appName = 'GRAFT';
  static const String version = '1.0.0';

  // Environment
  static const String env = String.fromEnvironment('ENV', defaultValue: 'development');

  static bool get isProduction => env == 'production';
  static bool get isDevelopment => env == 'development';
}