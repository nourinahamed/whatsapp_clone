import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chat_tile.dart';
import 'package:whatsapp/chats/model/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  List<ChatModel> chatList = [
    ChatModel(
        avatar:
            'https://pbs.twimg.com/profile_images/1286687023185592320/Q1r6FSus_400x400.jpg',
        isGroup: false,
        message: 'Hloo',
        name: 'Surya',
        updatedAt: '9.00 AM'),
    ChatModel(
        avatar: '',
        isGroup: true,
        message: 'Reminder',
        name: 'Flutter B-13',
        updatedAt: '8.00 AM'),
    ChatModel(
        avatar:
            'https://img3cf.b8cdn.com/images/uploads/user_photos/80/7898880_20171125091120.jpg',
        isGroup: false,
        message: 'Good Morning',
        name: 'Firoz',
        updatedAt: '5.00 AM'),
    ChatModel(
        avatar: '',
        isGroup: false,
        message: 'Evidaaa',
        name: 'Binti',
        updatedAt: '4.00 AM'),
    ChatModel(
        avatar:
            'https://media.istockphoto.com/photos/multi-ethnic-guys-and-girls-taking-selfie-outdoors-with-backlight-picture-id1368965646?b=1&k=20&m=1368965646&s=170667a&w=0&h=9DO-7OKgwO8q7pzwNIb3aq2urlw3DNTmpKQyvvNDWgY=',
        isGroup: true,
        message: 'Go Sleep!',
        name: 'Cousins',
        updatedAt: '3.00 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          //print(chatList(index));
          return ChatTile(
            chatData: chatList[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        //mini: true,
        onPressed: () {},
        backgroundColor: const Color(0xFF3b7a57),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
