import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/controller/post_states.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/services/post_api_provider.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/services/post_api_service.dart';

part 'post_controller.g.dart';

@Riverpod()
class PostController extends _$PostController {
  final PostApiService _apiService = PostApiService();
  @override
  PostStates build() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        return fecthPosts();
      },
    );
    return PostLoadingState();
  }

  void fecthPosts() async {
    try {
      state = PostLoadingState();
      var posts = await _apiService.fetchPosts();
      state = PostLoadedState(posts: posts);
    } catch (e) {
      state = PostErrorState(error: e.toString());
    }
  }
}
