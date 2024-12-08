import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  static const formState = GlobalKey;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Add Note",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.black87, // Dark background with a slight transparency
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your note title',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[850], // Darker background for input
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
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _contentController,
                style: const TextStyle(color: Colors.white),
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter your note content',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[850],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.tealAccent, // Vibrant save button
                    elevation: 5,
                  ),
                  icon: const Icon(Icons.save, color: Colors.black),
                  label: const Text(
                    'Save Note',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Black text for contrast
                    ),
                  ),
                  onPressed: () {
                    String title = _titleController.text;
                    String content = _contentController.text;

                    if (title.isNotEmpty && content.isNotEmpty) {
                      Navigator.pop(
                          context, {'title': title, 'content': content});
                    } else if (title.isEmpty && content.isEmpty) {
                      Navigator.of(context).pushReplacementNamed("homepage");
                    } else if (title.isEmpty && content.isNotEmpty) {
                      Navigator.pop(
                          context, {'title': "title", 'content': content});
                    } else if (title.isEmpty && content.isNotEmpty) {
                      Navigator.pop(context, {'title': "title", 'content': ""});
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
