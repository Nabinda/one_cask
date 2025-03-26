import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection_screen/data/model/collection_data_model.dart';
import 'package:pixelfield/features/collection_screen/data/repo/collection_repo.dart';

part 'collection_listing_state.dart';
part 'collection_listing_event.dart';

class CollectionListingBloc
    extends Bloc<CollectionListingEvent, CollectionListingState> {
  final CollectionRepo collectionRepo;

  CollectionListingBloc(this.collectionRepo) : super(CollectionInitial()) {
    on<FetchCollectionList>(_fetchCollection);
  }

  _fetchCollection(
      FetchCollectionList event, Emitter<CollectionListingState> emit) async {
    emit(CollectionLoading()); // Emit loading state
    try {
      final collections = await collectionRepo.getCollectionList();
      emit(CollectionLoaded(collections)); // Emit success state with data
    } catch (e) {
      emit(
          CollectionError(e.toString())); // Emit error state in case of failure
    }
  }
}
