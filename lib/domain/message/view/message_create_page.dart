import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            ),
            ElevatedButton(
              child: Text('개봉 날짜 선택: ${selectedDate.toLocal()}'),
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
            ),
            ElevatedButton(
              onPressed: () {
                final message = Message(
                  content: contentController.text,
                  unlockDate: selectedDate,
                  createdAt: DateTime.now(),
                );
                controller.addMessage(message);
                Get.back();
              },
              child: const Text('편지 저장'),
            ),
          ],
        ),
      ),
    );
  }
}
