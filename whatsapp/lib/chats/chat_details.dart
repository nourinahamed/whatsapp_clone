import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/chats/model/chat_model.dart';
import 'package:whatsapp/chats/model/single_message_model.dart';
import 'package:whatsapp/chats/widgets/bottom_popup.dart';
import 'package:whatsapp/chats/widgets/chat_bubble.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({Key? key, required this.chatDetails})
      : super(key: key);

  final ChatModel chatDetails;

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  bool isSend = false;
  bool showEmoji = false;

  final TextEditingController _messageController =
      TextEditingController(text: '');

  final FocusNode _focusNode = FocusNode();

  List<MessageModel> messages = [
    MessageModel(
        isReaded: true, isSend: true, message: 'Hiiiiii', sendAt: '9.00 AM'),
    MessageModel(
        isReaded: true, isSend: false, message: 'Hlooo', sendAt: '9.02 AM'),
    MessageModel(
        isReaded: true,
        isSend: true,
        message: 'How are you?',
        sendAt: '9.02 AM'),
    MessageModel(
        isReaded: true, isSend: false, message: 'Great', sendAt: '9.05 AM'),
    MessageModel(
        isReaded: false,
        isSend: true,
        message: 'How is you class going',
        sendAt: '9.05 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        leadingWidth: 95,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(width: 5),
            CircleAvatar(
                backgroundImage: (widget.chatDetails.avatar == '')
                    ? AssetImage((widget.chatDetails.isGroup!)
                        ? 'assets/images/group-icon.png'
                        : 'assets/images/user.png')
                    : NetworkImage(widget.chatDetails.avatar!)
                        as ImageProvider),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatDetails.name!),
            Text(
              'Lastseen today at ${widget.chatDetails.updatedAt}',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.video_call),
          const Icon(Icons.call),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  value: 1,
                  child: Text((widget.chatDetails.isGroup!)
                      ? 'Group Info'
                      : 'View Contacts')),
              PopupMenuItem(
                  value: 2,
                  child: Text((widget.chatDetails.isGroup!)
                      ? 'Group Media'
                      : 'Media, links and docs')),
              const PopupMenuItem(value: 3, child: Text('Search')),
              const PopupMenuItem(value: 4, child: Text('Mute Notifications')),
              const PopupMenuItem(
                  value: 5, child: Text('Disappearing messages')),
              const PopupMenuItem(value: 6, child: Text('Wallpaper')),
              const PopupMenuItem(value: 7, child: Text('More')),
            ];
          })
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/default-wallpaper.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatBubble(messageList: messages[index]);
                },
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          //color: Colors.red,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              focusNode: _focusNode,
                              controller: _messageController,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    isSend = true;
                                  });
                                } else {
                                  setState(() {
                                    isSend = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        _focusNode.unfocus();

                                        setState(() {
                                          showEmoji = !showEmoji;
                                        });
                                      },
                                      icon: Icon((showEmoji)
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions)),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  bottomPopup(),
                                              backgroundColor:
                                                  Colors.transparent);
                                        },
                                        icon: const Icon(Icons.attach_file),
                                      ),
                                      const Icon(Icons.currency_rupee),
                                      const Icon(Icons.camera_alt_outlined),
                                      const SizedBox(width: 10)
                                    ],
                                  ),
                                  hintText: 'Message'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton(
                              onPressed: () {
                                String tdata = DateFormat("hh:mm a")
                                    .format(DateTime.now());
                                setState(() {
                                  messages.add(MessageModel(
                                      isReaded: false,
                                      isSend: true,
                                      message: _messageController.text,
                                      sendAt: tdata));
                                  _messageController.clear();
                                });
                              },
                              child: Icon((isSend) ? Icons.send : Icons.mic)),
                        )
                      ],
                    ),
                    showEmoji == true ? selectEmoji() : Container()
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        _messageController.text = _messageController.text + emoji.emoji;
      },
      //textEditingController: ,
    );
  }
}
