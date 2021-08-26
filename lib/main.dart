import 'package:demo/Widgets/info_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Best Post Times",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (ctx, i) {
                    return const InfoCard(
                      comments: 22,
                      engagement: 3.4,
                      likes: 384,
                      time: "Sunday at 12PM",
                    );
                  },
                  separatorBuilder: (ctx, i) {
                    return SizedBox(height: 20);
                  },
                  itemCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
