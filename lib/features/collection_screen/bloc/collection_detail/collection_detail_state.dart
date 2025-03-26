// collection_state.dart
part of 'collection_detail_bloc.dart';

abstract class CollectionDetailState {}

class CollectionInitial extends CollectionDetailState {}

class CollectionLoading extends CollectionDetailState {}

class CollectionLoaded extends CollectionDetailState {
  final CollectionDataModel collections;

  CollectionLoaded(this.collections);
}

class CollectionError extends CollectionDetailState {
  final String message;

  CollectionError(this.message);
}
