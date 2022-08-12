import 'package:flutter/material.dart';
import 'package:whatsapp/calls/calls_screen.dart';
import 'package:whatsapp/chats/chatscreen.dart';
import 'package:whatsapp/status/status_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          //leading: const Icon(Icons.add),
          title: const Text('Whatspp'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            const SizedBox(
              width: 20,
            ),
            PopupMenuButton(
              onSelected: (value) {
               // print(value);
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('New Group'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('New Broadcast'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Linked Devices'),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    child: Text('Starred Messages'),
                  ),
                  const PopupMenuItem(
                    value: 5,
                    child: Text('Payments'),
                  ),
                  const PopupMenuItem(
                    value: 6,
                    child: Text('Settings'),
                  ),
                ];
              },
            )
          ],
          bottom: TabBar(controller: _controller, tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ]),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Text('Camera Page'),
            ChatScreen(),
            StatusScreen(),
            CallScreen(),
          ],
        ));
  }
}
