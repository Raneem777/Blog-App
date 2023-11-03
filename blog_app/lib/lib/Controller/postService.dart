import 'package:http/http.dart' as http;
import '../Model/userModel.dart';

class PostService {
  final client = http.Client();

  Future<List<Post>?> fetchPost() async {
    var response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return postFromJson(jsonString);
    } else {
      return null;
    }
  }
}
