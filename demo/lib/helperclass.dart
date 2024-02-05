import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'model.dart';

class StorageHelper {
  final box = GetStorage();

  List<SamplePosts> readSamplePosts() {
    final List<dynamic> jsonList = box.read<List>('samplePosts') ?? [];
    return samplePostsFromJson(jsonEncode(jsonList));
  }

  void writeSamplePosts(List<SamplePosts> samplePosts) {
    final jsonList = jsonDecode(samplePostsToJson(samplePosts));
    box.write('samplePosts', jsonList);
  }
}
