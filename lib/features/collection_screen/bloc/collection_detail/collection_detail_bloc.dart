import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/collection_screen/data/model/collection_data_model.dart';
import 'package:pixelfield/features/collection_screen/data/repo/collection_repo.dart';

part 'collection_detail_state.dart';
part 'collection_detail_event.dart';

class CollectionDetailBloc
    extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  final CollectionRepo collectionRepo;

  CollectionDetailBloc(this.collectionRepo) : super(CollectionInitial()) {
    on<FetchCollection>(_fetchCollection);
  }

  _fetchCollection(
      CollectionDetailEvent event, Emitter<CollectionDetailState> emit) async {
    emit(CollectionLoading()); // Emit loading state
    try {
      final collections =
          await collectionRepo.getCollection((event as FetchCollection).id);
      emit(CollectionLoaded(collections)); // Emit success state with data
    } catch (e) {
      emit(
          CollectionError(e.toString())); // Emit error state in case of failure
    }
  }
}
