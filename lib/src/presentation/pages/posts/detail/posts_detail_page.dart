import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/domain/models/post.dart';
import 'package:think_back/src/presentation/pages/posts/detail/posts_detail_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/detail/widget/posts_detail_content.dart';



class PostsDetailPage extends StatelessWidget {

  PostsDetailPage();

  @override
  Widget build(BuildContext context) {
    PostsDetailViewModel vm = Provider.of<PostsDetailViewModel>(context);
    Post postArg = ModalRoute.of(context)?.settings.arguments as Post;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PostsDetailContent(vm, postArg),
    );
  }
  
}