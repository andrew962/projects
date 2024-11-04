import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/post/bloc/post_bloc.dart';
import 'package:flutter_infinite_list/post/view/view.dart';
import 'package:http/http.dart' as http;

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Infinite List"),
        ),
        // backgroundColor: Colors.blueGrey,
        body: BlocProvider(
          create: (_) =>
              PostBloc(httpClient: http.Client())..add(PostFetched()),
          child: const PostsList(),
        ),
      ),
    );
  }
}
