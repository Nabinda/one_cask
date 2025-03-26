part of 'collection_detail_bloc.dart';

abstract class CollectionDetailEvent {}

class FetchCollection extends CollectionDetailEvent {
  final int id;
  FetchCollection(this.id);
}
