import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:pixelfield/features/collection_screen/data/model/collection_data_model.dart';

/// Check internet connection by pinging google
Future<bool> isInternetWorking() async {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://www.google.com'));

  try {
    final response = await dio.get('');
    if (response.statusCode == 200) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}

class CollectionRepo {
  // Get Data From Database (JSON FILE)
  Future<List<CollectionDataModel>> _getCollectionFromDB() async {
    String data = await rootBundle.loadString('assets/db/db.json');
    List<CollectionDataModel> parsedData = (json.decode(data) as List)
        .map((e) => CollectionDataModel.fromJson(e))
        .toList();
    _saveDataLocally(parsedData);
    await Future.delayed(const Duration(seconds: 2));
    return parsedData;
  }

  // Save Data to Hive Local DB
  void _saveDataLocally(List<CollectionDataModel> products) async {
    var box = await Hive.openBox('productsBox');
    await box.put('collection_products', json.encode(products));
  }

  // Get the saved data from HIVE LOCAL DB
  Future<List<CollectionDataModel>> _loadDataLocally() async {
    var box = await Hive.openBox('productsBox');
    String? storedData = box.get('collection_products');
    if (storedData == null || storedData.isEmpty) {
      return []; // Return an empty list if no data exists
    }
    List<CollectionDataModel> parsedData = (json.decode(storedData) as List)
        .map((e) => CollectionDataModel.fromJson(e))
        .toList();
    return parsedData;
  }

  // Get the collection list via JSON or Local DB
  Future<List<CollectionDataModel>> getCollectionList() async {
    if (await isInternetWorking()) {
      return _getCollectionFromDB();
    } else {
      final localData = await _loadDataLocally();
      if (localData.isEmpty) {
        throw 'No Internet Connection';
      } else {
        return localData;
      }
    }
  }

  /// Get Collection Details
  Future<CollectionDataModel> getCollection(int id) async {
    try {
      final data = await getCollectionList();
      return data.firstWhere((e) => e.id == id);
    } catch (e) {
      rethrow;
    }
  }
}
