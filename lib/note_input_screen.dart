import 'package:flutter/material.dart';
import 'note.dart';

class NoteInputScreen extends StatefulWidget {
  final Function(Note) onNoteAdded;

  NoteInputScreen({required this.onNoteAdded});

  @override
  _NoteInputScreenState createState() => _NoteInputScreenState();
}

class _NoteInputScreenState extends State<NoteInputScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _addNote() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      return;
    }
    final newNote = Note(
      title: _titleController.text,
      content: _contentController.text,
    );
    widget.onNoteAdded(newNote);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNote,
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
