
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/presentation/pages/posts/my_list/posts_my_list_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/my_list/widgets/posts_my_list_item.dart';

import '../../../../domain/models/post.dart';
import '../../../../domain/utils/resource.dart';
import '../list/widget/posts_list_item.dart';

class PostMyListPage extends StatelessWidget {
  const PostMyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    PostsMyListViewModel vm = Provider.of<PostsMyListViewModel>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: vm.getPostsById(),
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
            itemBuilder: (context, index) => PostsMyListItem(vm, postList.data[index]),
            itemCount: postList.data.length,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, 'post/create');
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}
