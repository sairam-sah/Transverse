import 'package:flutter/material.dart';
import 'model.dart';
import 'helperclass.dart';

class Translation extends StatelessWidget {
  final String category;
  const Translation({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    StorageHelper storageHelper = StorageHelper();

    List<SamplePosts?> temp = storageHelper.readSamplePosts();
    List<SamplePosts?> Translation =
        temp.where((element) => element?.category == category).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$category'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: Translation.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('English:${Translation[index]?.english}'),
              subtitle: Text('Nepalii:${Translation[index]?.nepalii}'),
            );
          }),
    );
  }
}
