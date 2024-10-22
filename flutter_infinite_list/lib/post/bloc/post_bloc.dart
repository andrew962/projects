import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/post/models/models.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 20;

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) =>
    (events, mapper) => events.throttle(duration);

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }
  final http.Client httpClient;

  void _onPostFetched(PostEvent event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      final posts = await _fetchPosts(startIndex: state.posts.length);

      if (posts.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }

      emit(state.copyWith(
          status: PostStatus.success, posts: [...state.posts, ...posts]));
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts({required int startIndex}) async {
    final response = await httpClient.get(Uri.https(
      'jsonplaceholder.typicode.com',
      '/posts',
      <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
    ));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body.map((e) {
        return Post.fromJson(e);
      }).toList();
    }
    throw Exception('Error fetching posts.');
  }
}
