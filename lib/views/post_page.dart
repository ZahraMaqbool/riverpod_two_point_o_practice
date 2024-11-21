import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/controller/post_controller.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/controller/post_states.dart';
import '../models/post_model.dart';

class POstPage extends ConsumerStatefulWidget {
  const POstPage({super.key});

  @override
  ConsumerState<POstPage> createState() => _POstPageState();
}

class _POstPageState extends ConsumerState<POstPage> {
  void fetchPost() {
    ref.read(postControllerProvider.notifier).fecthPosts();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        return fetchPost();
      },
    );
    PostStates postStates = ref.watch(postControllerProvider);
    return Scaffold(
      body: switch (postStates) {
        PostLoadingState() => const Center(
            child: CircularProgressIndicator(),
          ),
        PostLoadedState() => ListView.builder(
            itemCount: postStates.posts.length,
            itemBuilder: (context, index) {
              PostModel post = postStates.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          ),
        PostErrorState() => Center(
            child: Text(postStates.error),
          ),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: fetchPost,
        child:const Text('fetch'),
      ),
    );
  }
}
