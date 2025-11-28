import 'package:flutter/material.dart';

class HomeNotesPage extends StatelessWidget {
  const HomeNotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Notas'),
        elevation: 0,
      ),
      body: const Center(
        child: Text('Página principal de notas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a crear nota
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
