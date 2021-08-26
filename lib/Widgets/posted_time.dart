import 'package:flutter/material.dart';

class PostedTime extends StatelessWidget {
  final String time;

  const PostedTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.timer,
            color: Colors.purple,
            size: 14,
          ),
          const SizedBox(width: 10),
          Text(
            "Posted $time",
            style: const TextStyle(color: Colors.purple, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
