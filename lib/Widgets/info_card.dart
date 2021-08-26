import 'package:flutter/material.dart';

import 'build_row.dart';
import 'posted_time.dart';

class InfoCard extends StatelessWidget {
  final String time;
  final int likes;
  final int comments;
  final double engagement;

  const InfoCard(
      {Key? key,
      required this.time,
      required this.likes,
      required this.comments,
      required this.engagement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
            )
          ]),
      child: Row(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                height: 170,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.asset(
                    "assets/image.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Flexible(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostedTime(time: time),
                  const Spacer(),
                  buildRow("$likes Likes", Icons.favorite_border_outlined),
                  buildRow("$comments Comments", Icons.chat),
                  buildRow("$engagement% Average Engagement", Icons.person),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
