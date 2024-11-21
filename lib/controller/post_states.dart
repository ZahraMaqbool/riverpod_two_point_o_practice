import 'package:flutter/material.dart';
import 'package:riverpod_two_o_with_apis_f16_practice/models/post_model.dart';

@immutable
sealed class PostStates {}

@immutable
final class PostLoadingState extends PostStates {}

@immutable
final class PostLoadedState extends PostStates {
  final List<PostModel> posts;
  PostLoadedState({required this.posts});
}

@immutable
final class PostErrorState extends PostStates {
  final String error;
  PostErrorState({required this.error});
}
