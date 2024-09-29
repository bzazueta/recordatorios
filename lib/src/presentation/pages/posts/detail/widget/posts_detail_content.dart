import 'package:flutter/material.dart';
import 'package:think_back/src/presentation/pages/posts/detail/widget/posts_detail_userinfo.dart';

import '../../../../../domain/models/post.dart';
import '../posts_detail_viewmodel.dart';


class PostsDetailContent extends StatelessWidget {

  PostsDetailViewModel vm;
  Post postArg;///se reciben argumentos

  PostsDetailContent(this.vm, this.postArg);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image(
              image: NetworkImage(postArg.image),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(top: 40, left: 10),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                )
              ),
            )
          ],
        ),
        FutureBuilder(
          future: vm.getUser(postArg.idUser),
          builder: ((context, snapshot) {
            if (snapshot.data == null) { return Container(); }
            final data = snapshot.data;
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
              height: 90,
              child: Card(
                color: const Color.fromARGB(255, 58, 58, 58),
                child: PostsDetailUserInfo(data!)
              ),
            );
          })
        ),
        
        Container(
          margin: const EdgeInsets.only(left: 25, top: 10),
          child: Text(
            postArg.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19
            ),
          ),
        ),
        Container(
          height: 50,
          // width: 100,
          margin: const EdgeInsets.only(left: 20, top: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 58, 58, 58),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Wrap(
            direction: Axis.vertical,            
            alignment: WrapAlignment.center,
            children: [
              if (postArg.category == 'REUNION')... [
                Image.asset(
                  'assets/img/icon_pc.png'
                )
              ]
              else if (postArg.category == 'PAGOS')...[
                Image.asset(
                  'assets/img/icon_xbox.png'
                )
              ]
              else if (postArg.category == 'PROMESAS')...[
                Image.asset(
                  'assets/img/icon_nintendo.png'
                )
              ]
              else if (postArg.category == 'PLAYSTATION')...[
                Image.asset(
                  'assets/img/icon_ps4.png'
                )
              ],
              
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  postArg.category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 89, 89, 89),
          endIndent: 20,
          indent: 20,
          height: 50,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'DESCRIPCION',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,              
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Text(
            postArg.description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,              
            ),
          ),
        )
        
      ],
    );
  }
}

