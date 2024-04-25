import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/news/news_form/news_add_screen_model.dart';

class NewsAddScreen extends StatelessWidget {
  const NewsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<NewsAddScreenModel>();
    final newsTextController = model.newsTextController;
    onSend() => model.saveNews(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: onSend,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                cursorColor: const Color(0xFF436BF1),
                controller: newsTextController,
                autofocus: true,
                minLines: null,
                maxLengthEnforcement:
                    MaxLengthEnforcement.truncateAfterCompositionEnds,
                maxLines: null,
                maxLength: 144,
                expands: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What\'s new?',
                ),
              ),
            ),
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
