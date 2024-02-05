import 'package:flutter/material.dart';
import 'helperclass.dart';
import 'model.dart';
import 'translation.dart';

class Storage extends StatelessWidget {
  Storage({
    super.key,
    required String title,
  });
  final StorageHelper storageHelper = StorageHelper();

  @override
  Widget build(BuildContext context) {
    List<SamplePosts> samplePosts = storageHelper.readSamplePosts();
    Set<String> uniqueCategory =
        samplePosts.map((post) => post.category).toSet();
    List<String> categorylist = uniqueCategory.toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: categorylist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Translation(category: categorylist[index]),
                  ),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                color: Colors.greenAccent,
                child: Text(
                  categorylist[index],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 2,
            );
          },
        ));
  }
}
