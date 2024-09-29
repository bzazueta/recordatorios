
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/presentation/pages/posts/list/posts_list_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/list/widget/posts_list_item.dart';

import '../../../../domain/models/post.dart';
import '../../../../domain/utils/resource.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {

    PostsListViewModel vm = Provider.of<PostsListViewModel>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: vm.getPosts(),
        builder: ((context, snapshot) {
          final response = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No hay informacion',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (response is Error) {
            final data = response as Error;
            return Center(
              child: Text('Error: ${data.error}'),
            );
          }
          final postList = response as Success<List<Post>>;
          return ListView.builder(
            itemBuilder: (context, index) => PostsListItem(vm, postList.data[index]),
            itemCount: postList.data.length,
          );
        }),
      )
    );
  }
}
