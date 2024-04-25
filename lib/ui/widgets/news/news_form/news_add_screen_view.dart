import 'package:flutter/material.dart';

class NewsAddScreen extends StatelessWidget {
  const NewsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              cursorColor: Color(0xFF436BF1),
              autofocus: true,
              minLines: null,
              maxLines: null,
              // expands: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'What\'s new?',
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_photo_alternate),
            )
          ],
        ),
      ),
    );
  }
}
