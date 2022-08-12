import 'package:flutter/material.dart';
import 'package:whatsapp/chats/model/single_message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.messageList}) : super(key: key);

  final MessageModel messageList;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: messageList.isSend!? Alignment.centerRight: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150),
        child: Card(
            color: Colors.white,
            child: Stack(
              children: [
                  Padding(
                  padding:
                     const  EdgeInsets.only(left: 5, right: 30, top: 10, bottom: 20),
                  child: Text(messageList.message!),
                ),
                Positioned(
                    bottom: 4,
                    right: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                       const Text(
                          '9.00 AM',
                          style: TextStyle(fontSize: 10),
                        ),
                        Icon(
                          Icons.done_all,
                          size: 15,
                          color: messageList.isReaded!? Colors.blue : Colors.grey,
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
