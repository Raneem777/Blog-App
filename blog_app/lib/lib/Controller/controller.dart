import 'package:blog_app/lib/Model/userModel.dart';
import 'package:get/get.dart';
import 'postService.dart';

class PostController extends GetxController {
  final postService = PostService();

  var isLoading = true.obs;
  RxList postList = <Post>[].obs;

  PostController() {
    // Initialize the postList variable with an empty list of Post objects.
    postList.value = <Post>[];
  }

  @override
  void onInit() async {
    fetchPost();
    super.onInit();
  }

  Future<void> fetchPost() async {
    try {
      // ignore: unnecessary_null_comparison
      if (null != isLoading) {
        await postService.fetchPost().then((value) {
          postList.value = value!.cast<Post>();
        });
        postList.value = fetchPost() as List;
      } else {
        throw Exception("faild to load");
      }
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
