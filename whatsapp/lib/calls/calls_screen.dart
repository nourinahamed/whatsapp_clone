import 'package:flutter/material.dart';
import 'package:whatsapp/calls/call_tile.dart';
import 'package:whatsapp/calls/model/call_model.dart';

class CallScreen extends StatelessWidget {
  CallScreen({Key? key}) : super(key: key);

  List<CallModel> callList = [
    CallModel(
        avatar: '',
        calledAt: 'Today, 9.00 AM',
        name: 'Aysha',
        callIcon: 'video'),
    CallModel(
        avatar: '', calledAt: 'Today, 9.00 AM', name: 'Firoz', callIcon: ''),
    CallModel(
        avatar: '', calledAt: 'Today, 9.00 AM', name: 'Salma', callIcon: ''),
    CallModel(
        avatar: '', calledAt: 'Today, 9.00 AM', name: 'Thanu', callIcon: 'video'),
    CallModel(
        avatar: '', calledAt: 'Today, 9.00 AM', name: 'Firoz', callIcon: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: callList.length,
          itemBuilder: (BuildContext context, int index) {
            return CallTile(
              callData: callList[index],
            );
          }),
      floatingActionButton: FloatingActionButton(
        //mini: true,
        onPressed: () {},
        backgroundColor: const Color(0xFF3b7a57),
        child: const Icon(
          Icons.add_call,
        ),
      ),
    );
  }
}
