import 'package:riverpod_two_o_with_apis_f16_practice/models/post_model.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/services/post_api_provider.dart';

class PostApiService extends PostApiProvider {
  static PostApiService? postApiService;

  PostApiService._internal();
   factory PostApiService(){
    return postApiService??=PostApiService._internal();
   }

    Future<List<PostModel>> fetchPosts()async{
      var post = await fetch() as List;
      var data=post.map((e) => PostModel.fromJson(e)).toList();
      return data;
    }
  @override
  String get endpoint => 'posts';
}
