import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/theme.dart';
import '../get_x/message_controller.dart';
import '../state/message.dart';

class MessageCreatePage extends StatefulWidget {
  const MessageCreatePage({super.key});

  @override
  State<MessageCreatePage> createState() => _MessageCreatePageState();
}

class _MessageCreatePageState extends State<MessageCreatePage> {
  final contentController = TextEditingController();
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    final MessageController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('새 편지 작성'),
        actions: [
          // Show the '저장' button only when contentController text length is >= 2
          if (contentController.text.length >= 2)
            TextButton(
              onPressed: () {
                final message = Message(
                  content: contentController.text,
                  unlockDate: selectedDate,
                  createdAt: DateTime.now(),
                );
                controller.addMessage(message);
                Get.back();
              },
              child: const Text(
                '저장',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: contentController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: '미래의 나에게 하고 싶은 말을 적어보세요.',
              ),
              onChanged: (text) {
                setState(() {});
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now().add(const Duration(days: 1)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
                );
                if (picked != null) {
                  setState(() => selectedDate = picked);
                }
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(CafeTheme.accentColor),
              ),
              child: Text(
                '개봉 날짜 선택: ${selectedDate.toLocal().toString().substring(0, 16)}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  //dispose
  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }
}
