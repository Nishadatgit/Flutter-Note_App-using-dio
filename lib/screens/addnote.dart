import 'package:flutter/material.dart';
import 'package:noteapp/data/data.dart';
import 'package:noteapp/data/note_model/note_model.dart';

enum ActionType { addnote, editnote }

class AddNote extends StatelessWidget {
  AddNote({super.key, required this.type, this.id});

  final ActionType type;
  String? id;

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(type.name.toUpperCase()),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 131, 197, 49)),
                onPressed: () {
                  switch (type) {
                    case ActionType.addnote:
                      saveNote(context);
                      break;
                    case ActionType.editnote: //edit note
                      break;
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save'))
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: contentController,
                maxLength: 100,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Content',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        )),
      ),
    );
  }

  Future<void> saveNote(BuildContext ctx) async {
    final title = titleController.text;
    final content = contentController.text;

    final _newNote = NoteModel.create(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      content: content,
    );

    final newNote = await NoteFunctions().createNote(_newNote);
    if (newNote != null) {
      print('Note saved');
      Navigator.of(ctx).pop();
    } else {
      print('Error while saving note');
    }
  }
}
