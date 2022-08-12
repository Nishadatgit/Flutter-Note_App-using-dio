import 'package:flutter/material.dart';
import 'package:noteapp/screens/addnote.dart';

class NoteHomeScreen extends StatelessWidget {
  const NoteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'NoteApp',
          style: TextStyle(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add new'),
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => AddNote(type: ActionType.addnote)));
        },
      ),
      body: const SafeArea(child: NoteScreen()),
    );
  }
}

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});
  static const String content =
      """Dependencies specify other packages that your package needs in order to workTo automatically upgrade your package dependencies to the latest versionsconsider running flutter pub upgrade --major-versions. Alternatively,dependencies can be manually updated by changing the version numbers below tothe latest version available on pub.dev. To see which dependencies have newer
 versions available, run flutter pub outdated.""";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(
          10,
          (index) => Note(
                content: content,
                title: 'Lorem Ipsum $index',
                id: index.toString(),
              )),
    );
  }
}

class Note extends StatelessWidget {
  const Note(
      {super.key,
      required this.content,
      required this.title,
      required this.id});
  final String content;
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => AddNote(type: ActionType.editnote)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
            Expanded(
                child: Text(
              content,
              maxLines: 4,
              style: const TextStyle(fontSize: 15),
            ))
          ],
        ),
      ),
    );
  }
}
