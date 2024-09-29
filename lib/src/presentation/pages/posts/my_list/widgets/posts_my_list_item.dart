import 'package:flutter/material.dart';

import '../../../../../domain/models/post.dart';
import '../posts_my_list_viewmodel.dart';


class PostsMyListItem extends StatelessWidget {

  Post post;
  PostsMyListViewModel vm;

  PostsMyListItem(this.vm, this.post);

  @override
  Widget build(BuildContext context) {
    print('POSTS ID: ${post.id}');
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Card(
        color: const Color.fromARGB(255, 43, 43, 43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(post.image),
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        post.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Text(
                        post.description,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      )
                    ),
                  ],
                ),
                Column(
                  
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context, 
                          'posts/update',
                          arguments: post
                        );
                      }, 
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 27,
                      )
                    ),
                    IconButton(
                      onPressed: () {
                        vm.deletePost(post.id);
                      }, 
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 27,
                      )
                    ),
                  ],
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}