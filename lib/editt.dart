import 'package:flutter/material.dart';

class Note {
  final String title;
  final String description;

  Note({required this.title, required this.description});
}

class NotessApp extends StatefulWidget {
  @override
  _NotessAppState createState() => _NotessAppState();
}

class _NotessAppState extends State<NotessApp> {
  List<Note> notes = [
    Note(
      title: 'Note 1',
      description: 'Description for Note 1',
    ),
    Note(
      title: 'Note 2',
      description: 'Description for Note 5515',
    ),
    Note(
      title: 'Note 3',
      description: 'Description for Note 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Dismissible(
            key: Key(note.title),
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                notes.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Note deleted'),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
              ),
            ),
          );
        },
      ),
    );
  }
}
