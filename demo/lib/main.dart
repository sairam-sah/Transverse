import 'package:demo/listpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'newpage.dart';
import 'storage.dart';


void main() {
  GetStorage.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ' Transverse',
      getPages: [
        GetPage(name: '/Home', page: () =>const MyHomePage(title:'',)),
        GetPage(name: '/newpage', page: () => const Newpage(title: '',)),
        GetPage(name: '/storage', page: () => Storage(title:'',)),
      ],
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ' Demo Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get child => null;
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              InkWell(
              onTap:(){
                Get.to(() => const Newpage(title: '',));
              },
              child: Image.asset(
                "assets/image_960.png"
              ),)
              ],
              
        ),
      ),
      floatingActionButton:Stack(
        children:[
          Positioned(
            left: 32.0,
            bottom: 16.0,
            child: FloatingActionButton(
              onPressed: (){
              Get.to(()=>Storage(title:'',));
              },
              tooltip: 'Left FAB',
              child:const Icon(Icons.category),
          ),
          ),
        
            Positioned(
            left: 300.0,
            bottom: 16.0,
            child: FloatingActionButton(
            onPressed: (){
            Get.to(()=>ListPage( title: '', id: '', samplePosts: const [],));
              },
              tooltip: 'Right FAB',
              child:const Icon(Icons.list),
          ),
          ),
          ],
        ),
      
    );
  }

}
