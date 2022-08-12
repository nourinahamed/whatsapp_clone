import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chat_details.dart';
import 'package:whatsapp/chats/model/chat_model.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chatData}) : super(key: key);

  final ChatModel chatData;

  @override
  Widget build(BuildContext context) {
    //print(chatData);
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailsScreen(chatDetails: chatData),
            ));
      }),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          //backgroundColor: Colors.grey,
          //child: Icon(Icons.person),
          //turnary operator (condition)?true:false
          backgroundImage: (chatData.avatar == '')?
          AssetImage((chatData.isGroup!)
              ? 'assets/images/group-icon.png'
              : 'assets/images/user.png') :
          NetworkImage(chatData.avatar!) as ImageProvider ,  
        ),
        title: Text(chatData.name!),
        subtitle: Text(chatData.message!),
        trailing: Text(chatData.updatedAt!),
      ),
    );
  }
}
