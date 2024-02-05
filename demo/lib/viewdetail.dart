import 'package:flutter/material.dart';

import 'model.dart';

class Viewdetail extends StatelessWidget {
  const Viewdetail({super.key, required this.samplePosts, required String id});
  final SamplePosts samplePosts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'English Text: ${samplePosts.english}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Nepali Text: ${samplePosts.nepalii}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'English_Description Text: ${samplePosts.englishDesc}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Nepali_Description Text: ${samplePosts.nepaliDesc}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
              ]),
        ));
  }
}
