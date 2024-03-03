import 'package:flutter/material.dart';
import 'note.dart';
import 'note_input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<Note> _notes = [];

  void _addNote() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteInputScreen(
          onNoteAdded: (note) {
            setState(() {
              _notes.add(note);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Notes App'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}