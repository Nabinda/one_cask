// collection_state.dart
part of 'collection_listing_bloc.dart';

abstract class CollectionListingState {}

class CollectionInitial extends CollectionListingState {}

class CollectionLoading extends CollectionListingState {}

class CollectionLoaded extends CollectionListingState {
  final List<CollectionDataModel> collections;

  CollectionLoaded(this.collections);
}

class CollectionError extends CollectionListingState {
  final String message;

  CollectionError(this.message);
}
