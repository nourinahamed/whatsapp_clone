import 'package:flutter/material.dart';
import 'package:whatsapp/calls/model/call_model.dart';

class CallTile extends StatelessWidget {
  const CallTile({Key? key, required this.callData}) : super(key: key);

  final CallModel callData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person),
      ),
      title: Text(callData.name!),
      subtitle: Text(callData.calledAt!),
      trailing: (callData.callIcon == 'video')
          ? const Icon(Icons.call, color: Color(0xFF3b7a57))
          : const Icon(Icons.video_call, color: Color(0xFF3b7a57)),
    );
  }
}
