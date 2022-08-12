import 'package:flutter/material.dart';
import 'package:whatsapp/status/model/status_model.dart';
import 'package:whatsapp/status/status_tile.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({Key? key}) : super(key: key);

  List<StatusModel> statusList = [
    StatusModel(avatar: '', updatedAt: 'Today, 9.00 AM', name: 'Aysha'),
    StatusModel(avatar: '', updatedAt: 'Today, 9.00 AM', name: 'Aysha'),
    StatusModel(avatar: '', updatedAt: 'Today, 9.00 AM', name: 'Aysha'),
    StatusModel(avatar: '', updatedAt: 'Today, 9.00 AM', name: 'Aysha'),
    StatusModel(avatar: '', updatedAt: 'Today, 9.00 AM', name: 'Aysha'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
            title: Text('My Status'),
            subtitle: Text('Tap to add status update'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    height: 30,
                    child: Text('1'),
                  );
                },
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    height: 30,
                    child: Text('2'),
                  );
                },
              ),
            ],
          )
        ],
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          mini: true,
          onPressed: () {},
          backgroundColor: const Color(0xFF808080),
          child: const Icon(
            Icons.edit,
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF3b7a57),
          child: const Icon(
            Icons.camera,
          ),
        ),
      ]),
    );
  }
}
