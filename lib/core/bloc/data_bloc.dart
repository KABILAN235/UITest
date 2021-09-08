import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo/core/Helper/HTTPHelper.dart';
import 'package:demo/core/models/PostModel.dart';
import 'package:demo/core/services/HTTPService.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final HTTPService httpService;
  DataBloc(this.httpService) : super(DataLoading());

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if (event is GetInitialData) {
      yield DataLoading();
      try {
        final loadedData = await httpService.getDataFromAPI();
        final data = _parseData(loadedData);
        yield FetchedData(data);
      } catch (e) {
        yield DataError();
      }
    }
  }

  List<PostModel> _parseData(HttpResponse rawData) {
    return List.from(rawData.data).map((e) {
      return PostModel(
          postedTime: DateTime.parse(e['posted_time'].toString()),
          likes: int.parse(e['likes'].toString()),
          comments: int.parse(e['comments'].toString()),
          engagement: double.parse(e['engagement'].toString()),
          photoURL: e['photo_url'].toString());
    }).toList();
  }
}
