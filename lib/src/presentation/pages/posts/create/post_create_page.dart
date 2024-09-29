import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/presentation/pages/posts/create/posts_create_response.dart';
import 'package:think_back/src/presentation/pages/posts/create/posts_create_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/create/widget/post_create_content.dart';

class PostCreatePage extends StatelessWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    PostsCreateViewModel vm = Provider.of<PostsCreateViewModel>(context);///proveemos el viewmodel con provider

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PostsCreateResponse(context, vm);
    });
    return  Scaffold(
      body: PostCreateContent(vm),
    );
  }
}
