class CollectionDataModel {
  final int? id;
  final String? name;
  final int? age;
  final String? code;
  final String? bottleNumber;
  final String? imageUrl;

  CollectionDataModel({
    this.id,
    this.name,
    this.age,
    this.code,
    this.bottleNumber,
    this.imageUrl,
  });

  // Convert JSON to CollectionDataModel object
  factory CollectionDataModel.fromJson(Map<String, dynamic> json) {
    return CollectionDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      code: json['code'] as String?,
      bottleNumber: json['bottle_number'] as String?,
      imageUrl: json['image_url'] as String?,
    );
  }

  // Convert CollectionDataModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'code': code,
      'bottle_number': bottleNumber,
      'image_url': imageUrl,
    };
  }
}
