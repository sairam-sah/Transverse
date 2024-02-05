import 'package:demo/helperclass.dart';
import 'package:demo/viewdetail.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class ListPage extends StatelessWidget {
  final StorageHelper storageHelper = StorageHelper();
  final List<SamplePosts> samplePosts;
  final String title;
  ListPage({
    super.key,
    required this.samplePosts,
    required this.title,
    required String id,
  });

  @override
  Widget build(BuildContext context) {
    List<SamplePosts> samplePosts = storageHelper.readSamplePosts();
    Set<String> uniqueid = samplePosts.map((post) => post.id).toSet();
    List<String> idlist = uniqueid.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: idlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('id: ${samplePosts[index].id}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => Viewdetail(
                    id: idlist[index],
                    samplePosts: samplePosts[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
