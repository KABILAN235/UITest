import 'package:demo/core/services/HTTPService.dart';
import 'package:demo/ui/Widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/data_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DataBloc(HTTPFakeService())..add(GetInitialData()),
    child: MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Best Post Times",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<DataBloc, DataState>(
                builder: (context, state) {
                  if (state is FetchedData) {
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (ctx, index) {
                            final data = state.data[index];
                            return InfoCard(
                              imgURL: data.photoURL,
                              comments: data.comments,
                              engagement: data.engagement,
                              likes: data.likes,
                              time:
                                  "${data.postedTime.weekday} at ${data.postedTime.hour}",
                            );
                          },
                          separatorBuilder: (ctx, i) {
                            return SizedBox(height: 20);
                          },
                          itemCount: state.data.length),
                    );
                  } else if (state is DataError) {
                    return Center(
                      child: Text("Error Loading the Data"),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
