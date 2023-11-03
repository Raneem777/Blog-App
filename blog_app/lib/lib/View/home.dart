import 'package:blog_app/lib/Controller/controller.dart';
import 'package:blog_app/lib/View/reusable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PostController postController = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    postController.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 116, 2, 2),
          title: const Text("My Blogs"),
          centerTitle: true,
        ),
        body:
        
          Obx(() {
          if (postController.isLoading.value) {
            return const Center(child: CircularProgressIndicator(color:  Color.fromARGB(255, 116, 2, 2),));
          } else {
                return ListView.builder(
              itemCount: postController.postList.length,
              itemBuilder: (context, index) {
                return blog(postController.postList[index].title.toString(),
                    postController.postList[index].body.toString());
              },
            );

          }
        }),      
        );
  }
}
