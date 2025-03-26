import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pixelfield/features/collection_screen/data/model/collection_data_model.dart';

class CollectionRepo {
  Future<List<CollectionDataModel>> getCollectionList() async {
    String data = await rootBundle.loadString('assets/db/db.json');
    List<CollectionDataModel> parsedData = (json.decode(data) as List)
        .map((e) => CollectionDataModel.fromJson(e))
        .toList();
    await Future.delayed(const Duration(seconds: 2));
    return parsedData;
  }

  Future<CollectionDataModel> getCollection(int id) async {
    String data = await rootBundle.loadString('assets/db/db.json');
    List<CollectionDataModel> parsedData = (json.decode(data) as List)
        .map((e) => CollectionDataModel.fromJson(e))
        .toList();
    await Future.delayed(const Duration(seconds: 2));
    return parsedData.firstWhere((e) => e.id == id);
  }
}
