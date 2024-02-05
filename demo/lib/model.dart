// To parse this JSON data, do
//
//     final samplePosts = samplePostsFromJson(jsonString);

import 'dart:convert';

List<SamplePosts> samplePostsFromJson(String str) => List<SamplePosts>.from(
    json.decode(str).map((x) => SamplePosts.fromJson(x)));

String samplePostsToJson(List<SamplePosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePosts {
  String english;
  String nepalii;
  String category;
  String nepaliDesc;
  String englishDesc;
  String id;

  SamplePosts({
    required this.english,
    required this.nepalii,
    required this.category,
    required this.nepaliDesc,
    required this.englishDesc,
    required this.id,
  });

  factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
        english: json["english"],
        nepalii: json["nepalii"],
        category: json["Category"],
        nepaliDesc: json["nepali_desc"],
        englishDesc: json["english_desc"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "english": english,
        "nepalii": nepalii,
        "Category": category,
        "nepali_desc": nepaliDesc,
        "english_desc": englishDesc,
        "id": id,
      };
}

enum Category {
  // ignore: constant_identifier_names
  AVON,
  // ignore: constant_identifier_names
  BEDFORDSHIRE,
  // ignore: constant_identifier_names
  BERKSHIRE,
  // ignore: constant_identifier_names
  BORDERS,
  // ignore: constant_identifier_names
  BUCKINGHAMSHIRE,
  // ignore: constant_identifier_names
  CAMBRIDGESHIRE
}
class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
