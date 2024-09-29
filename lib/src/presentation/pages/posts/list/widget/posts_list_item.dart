import 'package:flutter/material.dart';
import 'package:think_back/src/presentation/pages/posts/list/widget/posts_list_userinfo.dart';

import '../../../../../domain/models/post.dart';
import '../posts_list_viewmodel.dart';


class PostsListItem extends StatelessWidget {

  Post post;
  PostsListViewModel vm;

  PostsListItem(this.vm, this.post);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            'posts/detail',
            arguments: post
        );
      },
      child: Container(
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Text(
                            post.name,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          )
                      ),
                      PostsListUserInfo(vm, post.idUser),
                      Container(
                          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
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
                  const Spacer(),
                  post.likes.contains(vm.id)
                      ? GestureDetector(
                          onTap: () {
                            vm.deleteLike(post.id);
                          },
                          child: Image.asset(
                            'assets/img/like.png',
                            width: 30,
                            height: 30,
                          ),
                        )
                      : GestureDetector(
                    onTap: () {
                       vm.like(post.id);
                    },
                    child: Image.asset(
                      'assets/img/like_outline.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 10),
                    child: Text(
                      post.likes.length.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}