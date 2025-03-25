import 'package:hive/hive.dart';
import '../state/message.dart';

class MessageRepository {
  final Box<Message> _box = Hive.box<Message>('messages');

  Future<void> addMessage(Message message) async {
    await _box.add(message);
  }

  Future<List<Message>> getAllMessages() async {
    return _box.values.toList();
  }

  Future<void> deleteMessage(int index) async {
    await _box.deleteAt(index);
  }
}
