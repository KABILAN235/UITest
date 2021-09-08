part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataLoading extends DataState {}

class DataError extends DataState {}

class FetchedData extends DataState {
  final List<PostModel> data;

  FetchedData(this.data);
}
