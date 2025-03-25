import 'package:get/get.dart';
import '../repository/message_repository.dart';
import '../state/message.dart';

class MessageController extends GetxController {
  final MessageRepository repository = MessageRepository();

  RxList<Message> messages = <Message>[].obs;

  @override
  void onInit() {
    loadMessages();
    super.onInit();
  }

  void loadMessages() async {
    messages.value = await repository.getAllMessages();
  }

  void addMessage(Message message) async {
    await repository.addMessage(message);
    loadMessages();
  }

  void deleteMessage(int index) async {
    await repository.deleteMessage(index);
    loadMessages();
  }
}
