import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String notesDetail = '/notes-detail';
  static const String createNote = '/create-note';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Home - Notas'),
            ),
          ),
        );
      case notesDetail:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Detalle de Nota'),
            ),
          ),
        );
      case createNote:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Crear Nueva Nota'),
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Página no encontrada'),
            ),
          ),
        );
    }
  }
}
