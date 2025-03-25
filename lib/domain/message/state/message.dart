import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class Message {
  @HiveField(0)
  final String content;

  @HiveField(1)
  final DateTime unlockDate;

  @HiveField(2)
  final DateTime createdAt;

  Message({
    required this.content,
    required this.unlockDate,
    required this.createdAt,
  });
}

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 0;

  @override
  Message read(BinaryReader reader) {
    return Message(
      content: reader.readString(),
      unlockDate: DateTime.parse(reader.readString()),
      createdAt: DateTime.parse(reader.readString()),
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer.writeString(obj.content);
    writer.writeString(obj.unlockDate.toIso8601String());
    writer.writeString(obj.createdAt.toIso8601String());
  }
}
