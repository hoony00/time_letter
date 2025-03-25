import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get_x/message_controller.dart';
import 'message_create_page.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MessageController controller = Get.put(MessageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 편지 목록'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const MessageCreatePage());
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.messages.isEmpty) {
          return const Center(child: Text('아직 저장된 편지가 없습니다.'));
        }
        return ListView.builder(
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final msg = controller.messages[index];
            final isLocked = msg.unlockDate.isAfter(DateTime.now());
            return ListTile(
              title: Text(isLocked ? '🔒 잠긴 편지' : msg.content),
              subtitle: Text('개봉일: ${msg.unlockDate.toLocal()}'),
              onTap: () {
                if (isLocked) {
                  Get.snackbar('알림', '아직 개봉할 수 없습니다.');
                } else {
                  // AdMob 광고 노출 후 메시지 내용 표시 예정
                  Get.snackbar('편지 내용', msg.content);
                }
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.deleteMessage(index);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
