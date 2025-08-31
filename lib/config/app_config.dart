class AppConfig {
  // Configuration de l'API
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.seed.com',
  );

  static const String apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'YOUR_API_KEY',
  );

  // Configuration de l'application
  static const String appName = 'Seed';
  static const String appVersion = '1.0.0';

  // Configuration des timeouts
  static const int connectionTimeout = 30000; // 30 secondes
  static const int receiveTimeout = 30000; // 30 secondes

  // Configuration de la pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Configuration des retry
  static const int maxRetries = 3;
  static const int retryDelay = 1000; // 1 seconde

  // Configuration des caches
  static const int cacheExpirationHours = 24;

  // Configuration des logs
  static const bool enableLogging = true;
  static const String logLevel = 'INFO';
}
