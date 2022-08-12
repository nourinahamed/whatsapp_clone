import 'package:flutter/material.dart';

class bottomPopup extends StatelessWidget {
  const bottomPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Card(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconWidget(
                      icon: const Icon(Icons.insert_drive_file),
                      color: Colors.indigo,
                      text: 'Document',
                    ),
                    iconWidget(
                      icon: const Icon(Icons.camera_alt_outlined),
                      color: Colors.pink,
                      text: 'Camera',
                    ),
                    iconWidget(
                      icon: const Icon(Icons.insert_photo),
                      color: Colors.purple,
                      text: 'Gallery',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconWidget(
                      icon: const Icon(Icons.headphones),
                      color: Colors.red,
                      text: 'Audio',
                    ),
                    iconWidget(
                      icon: const Icon(Icons.currency_rupee),
                      color: Colors.grey,
                      text: 'Payment',
                    ),
                    iconWidget(
                      icon: const Icon(Icons.location_pin),
                      color: Colors.green,
                      text: 'location',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(width: 30),
                  iconWidget(
                    icon: const Icon(Icons.person),
                    color: Colors.blue,
                    text: 'Contact',
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}

Widget iconWidget({Icon? icon, Color? color, String? text}) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: icon,
      ),
      const SizedBox(height: 10),
      Text(text!),
    ],
  );
}
