/// Constantes de la aplicación
class AppConstants {
  // Strings
  static const String appTitle = 'Mini Bloc Notas';
  static const String appDescription = 'Una aplicación simple para gestionar notas';

  // Validación
  static const int minTitleLength = 1;
  static const int maxTitleLength = 100;
  static const int minContentLength = 1;

  // Tiempos
  static const Duration shortAnimationDuration = Duration(milliseconds: 300);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 1000);

  // Números
  static const int maxNotesPerPage = 20;
  static const int debounceDelayMs = 500;
}
