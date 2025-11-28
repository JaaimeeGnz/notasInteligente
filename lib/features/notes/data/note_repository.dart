import 'package:sqflite/sqflite.dart';
import '../../core/models/note.dart';
import '../../core/database/database_service.dart';

class NoteRepository {
  final DatabaseService _databaseService;

  NoteRepository(this._databaseService);

  static const String _tableName = 'notes';

  /// Obtener todas las notas
  Future<List<Note>> getAllNotes() async {
    final db = await _databaseService.database;
    final maps = await db.query(_tableName, orderBy: 'createdAt DESC');
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  /// Obtener una nota por ID
  Future<Note?> getNoteById(int id) async {
    final db = await _databaseService.database;
    final maps = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return null;
    return Note.fromMap(maps.first);
  }

  /// Crear una nueva nota
  Future<Note> createNote(Note note) async {
    final db = await _databaseService.database;
    final id = await db.insert(_tableName, note.toMap());
    return note.copyWith(id: id);
  }

  /// Actualizar una nota existente
  Future<void> updateNote(Note note) async {
    final db = await _databaseService.database;
    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  /// Eliminar una nota
  Future<void> deleteNote(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Buscar notas por título
  Future<List<Note>> searchNotes(String query) async {
    final db = await _databaseService.database;
    final maps = await db.query(
      _tableName,
      where: 'title LIKE ?',
      whereArgs: ['%$query%'],
      orderBy: 'createdAt DESC',
    );
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }
}
