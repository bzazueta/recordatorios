import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:think_back/src/presentation/pages/posts/update/posts_update_response.dart';
import 'package:think_back/src/presentation/pages/posts/update/posts_update_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/update/widget/posts_update_content.dart';

import '../../../../domain/models/post.dart';

class PostsUpdatePage extends StatelessWidget {

  const PostsUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    PostsUpdateViewModel vm = Provider.of<PostsUpdateViewModel>(context);
    Post postArg = ModalRoute.of(context)?.settings.arguments as Post;
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {///esto se ejecuta cuando termina de cargar la pagina
      PostsUpdateResponse(context, vm);
    });

    return  Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: vm.loadData(postArg),///antes pasar los argumentos hace una peticion a load data y pasa el viewmodek como argumento
        builder: (context, _) => PostsUpdateContent(vm, postArg)
      ),
    );
    
  }
}