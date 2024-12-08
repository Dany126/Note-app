import 'package:flutter/material.dart';
import 'package:notes_2/editnotes.dart';

class Notedetails extends StatelessWidget {
  final Map<String, String> note; // Note received from HomePage
  final int index; // Index to track the note position in the list

  const Notedetails({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          note['title'] ?? 'Note Details',
        ),
        backgroundColor: Colors.teal, // AppBar color
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[850], // Set background color
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Note Title
            Text(
              note['title'] ?? '',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Changed title text color for visibility
              ),
            ),
            const SizedBox(height: 16),
            // Note Content
            Text(
              note['content'] ?? '',
              style: const TextStyle(
                fontSize: 16,
                color:
                    Colors.white, // Changed content text color for visibility
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: 'Edit Note',
            child: FloatingActionButton(
              heroTag: 'edit',
              onPressed: () async {
                // Navigate to the EditNote screen and wait for the result
                final updatedNote = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditNote(note: note),
                  ),
                );

                // If an updated note is returned, update the note in the HomePage
                if (updatedNote != null && updatedNote is Map<String, String>) {
                  Navigator.pop(context, {'index': index, 'note': updatedNote});
                }
              },
              child: const Icon(Icons.edit),
            ),
          ),
          const SizedBox(height: 16),
          Tooltip(
            message: 'Delete Note',
            child: FloatingActionButton(
              heroTag: 'delete',
              onPressed: () {
                // Show a confirmation dialog before deleting
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Delete'),
                      content: const Text(
                          'Are you sure you want to delete this note?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Return the delete action back to the HomePage
                            Navigator.pop(
                                context, {'delete': true, 'index': index});
                            Navigator.of(context)
                                .pop(); // Close the Notedetails screen
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.delete),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
