/// Utilidades para formateo de texto y datos
extension DateTimeExtension on DateTime {
  /// Obtener fecha formateada en formato dd/MM/yyyy
  String toFormattedDate() {
    return '$day/$month/$year';
  }

  /// Obtener fecha y hora formateada
  String toFormattedDateTime() {
    return '$day/$month/$year $hour:$minute';
  }

  /// Obtener tiempo relativo (hace X minutos, hace X horas, etc.)
  String toRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'Hace unos segundos';
    } else if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} minuto${difference.inMinutes > 1 ? 's' : ''}';
    } else if (difference.inHours < 24) {
      return 'Hace ${difference.inHours} hora${difference.inHours > 1 ? 's' : ''}';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} día${difference.inDays > 1 ? 's' : ''}';
    } else {
      return toFormattedDate();
    }
  }
}

extension StringExtension on String {
  /// Capitalizar la primera letra
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Truncar texto a una longitud máxima
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength - suffix.length) + suffix;
  }
}
