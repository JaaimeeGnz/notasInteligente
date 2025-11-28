import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/database/database_service.dart';
import '../data/note_repository.dart';
import '../../core/models/note.dart';

/// Proveedor de DatabaseService (Singleton)
final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

/// Proveedor de NoteRepository
final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  final databaseService = ref.watch(databaseServiceProvider);
  return NoteRepository(databaseService);
});

/// Proveedor para obtener todas las notas
final allNotesProvider = FutureProvider<List<Note>>((ref) async {
  final repository = ref.watch(noteRepositoryProvider);
  return repository.getAllNotes();
});

/// Proveedor para obtener una nota específica por ID
final noteByIdProvider = FutureProvider.family<Note?, int>((ref, id) async {
  final repository = ref.watch(noteRepositoryProvider);
  return repository.getNoteById(id);
});

/// Proveedor para buscar notas
final searchNotesProvider = FutureProvider.family<List<Note>, String>((ref, query) async {
  final repository = ref.watch(noteRepositoryProvider);
  return repository.searchNotes(query);
});
