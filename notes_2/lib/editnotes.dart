import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  final Map<String, String> note;

  const EditNote({super.key, required this.note});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the current note's title and content
    _titleController = TextEditingController(text: widget.note['title']);
    _contentController = TextEditingController(text: widget.note['content']);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // AppBar color
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Pass the updated note back to the Notedetails page
              Navigator.pop(context, {
                'title': _titleController.text,
                'content': _contentController.text,
              });
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black87, // Background color
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(
                fontSize: 18,
                color: Colors.tealAccent, // Label color
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                hintText: 'Edit your note title',
                hintStyle:
                    const TextStyle(color: Colors.white70), // Hint text color
                filled: true,
                fillColor: Colors.grey[850], // TextField background color
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Content',
              style: TextStyle(
                fontSize: 18,
                color: Colors.tealAccent, // Label color
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: _contentController,
                style: const TextStyle(color: Colors.white), // Text color
                maxLines: null, // Allows the text field to expand as needed
                decoration: InputDecoration(
                  hintText: 'Edit your note content',
                  hintStyle:
                      const TextStyle(color: Colors.white70), // Hint text color
                  filled: true,
                  fillColor: Colors.grey[850], // TextField background color
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.tealAccent, // Button color
                  elevation: 5,
                ),
                icon: const Icon(Icons.save,
                    color: Colors.black), // Button icon color
                label: const Text(
                  'Save Note',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Button text color
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'title': _titleController.text,
                    'content': _contentController.text,
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
