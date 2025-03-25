import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'constants/theme.dart';
import 'domain/message/state/message.dart';
import 'domain/message/view/message_list_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Hive 초기화는 나중에 하고, 우선 기본 앱부터 실행되도록 합니다
    await Hive.initFlutter();
    Hive.registerAdapter(MessageAdapter());
    await Hive.openBox<Message>('messages');

    runApp(const MyApp());
  } catch (e) {
    print('Error during initialization: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '미래의 나에게 보내는 편지',
      theme: CafeTheme.themeData(),
      home: MessageListPage(),
    );
  }
}
