import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:core';

class Newpage extends StatefulWidget {
  const Newpage({super.key, required String title});

  Type get textTitle => Newpage;

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  List<SamplePosts> samplePosts = [];

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    // Load cached data from get_storage
    samplePosts = (box.read<List>('samplePosts') ?? []).cast<SamplePosts>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEW'),
        centerTitle: false,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshort) {
          print(snapshort);
          if (snapshort.hasData) {
            return ListView.builder(
                itemCount: samplePosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 170,
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'id: ${samplePosts[index].id}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'english: ${samplePosts[index].english}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'nepali: ${samplePosts[index].nepalii}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'category: ${samplePosts[index].category}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'nepali_desc: ${samplePosts[index].nepalii}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'english_desc: ${samplePosts[index].english}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<SamplePosts>> getData() async {
    final response = await http.get(Uri.parse(
        'https://5bf6513ba1a6a70013726266.mockapi.io/api/v1/translate'));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body.toString());
      var data = jsonData.cast<Map<String, dynamic>>();
      samplePosts.clear(); //Clear existing data before adding new data
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePosts.fromJson(index));
      }

      // Save data to get_storage
      box.write('samplePosts', samplePosts);

      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
