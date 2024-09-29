import 'package:flutter/foundation.dart';

import '../../../../domain/models/post.dart';
import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/uses_cases/post/posts_usecases.dart';
import '../../../../domain/utils/resource.dart';


class PostsMyListViewModel extends ChangeNotifier {

  PostsUseCases _postsUseCases;
  AuthUseCases _authUseCases;

  PostsMyListViewModel(this._authUseCases, this._postsUseCases);

  Stream<Resource<List<Post>>> getPostsById() {
    String idUser = _authUseCases.getUser.userSession?.uid ?? '';///primero obtenemos el iduser de firebase
    return _postsUseCases.getPostsById.launch(idUser);///pasamos el iduser para obner el post creado por el usuario
  }

  deletePost(String idPost) async {
    await _postsUseCases.delete.launch(idPost);
    notifyListeners();
  }

}