import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:noteapp/data/get_all_notes_response/get_all_notes_response.dart';
import 'package:noteapp/data/note_model/note_model.dart';
import 'package:noteapp/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel note);
  Future<List<NoteModel>> getAll();
  Future<NoteModel?> updateNote(NoteModel note);
  Future<void> deleteNote(String id);
}

class NoteFunctions extends ApiCalls {
  NoteFunctions() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }
  final dio = Dio();
  final url = Url();
  @override
  Future<NoteModel?> createNote(NoteModel note) async {
    try {
      final result = await dio.post(url.createNote, data: note.toJson());
      final resultAsJson = jsonDecode(result.data);
      return NoteModel.fromJson(resultAsJson as Map<String, dynamic>);
    } on DioError catch (e) {
      print(e);
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAll() async {
    final _result = await dio.get<GetAllNotesResponse>(url.getAllNotes);
    if (_result.data == null) {
      return [];
    } else {
      return _result.data!.data;
    }
  }

  @override
  Future<NoteModel?> updateNote(NoteModel note) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
