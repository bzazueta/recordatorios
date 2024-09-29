import 'package:flutter/material.dart';

import '../posts_list_viewmodel.dart';

class PostsListUserInfo extends StatelessWidget {

  PostsListViewModel vm;
  String idUser;

  PostsListUserInfo(this.vm, this.idUser);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vm.getUserInfo(idUser),
      builder: (context, data) {
        final user = data.data;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Text(
            user?.username ?? '',
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 195, 195, 195),
            ),
          )
        );
      }
    );
  }
}