import 'package:flutter/foundation.dart';

import '../../../../domain/models/post.dart';
import '../../../../domain/models/user_data.dart';
import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/uses_cases/post/posts_usecases.dart';
import '../../../../domain/uses_cases/users/users_usecases.dart';
import '../../../../domain/utils/resource.dart';


class PostsListViewModel extends ChangeNotifier {

  PostsUseCases _postsUseCases;
  AuthUseCases _authUseCases;
  UsersUseCase _usersUseCase;
  String _id = '';
  String get id => _id;

  PostsListViewModel(this._authUseCases, this._postsUseCases, this._usersUseCase) {
    _id = _authUseCases.getUser.userSession?.uid ?? '';
  }

  Stream<Resource<List<Post>>> getPosts() => _postsUseCases.getPosts.launch();
  Future<UserData> getUserInfo(String idUser) => _usersUseCase.getUserByIdOnce.launch(idUser);


  like(String idPost) async {
    await _postsUseCases.like.launch(idPost, id); ///no se usa notifyListeners(); porque estamos usando streams
    ///cualquier cambio en firestore en tiempo real lo regrrsa con stream => Stream<Resource<List<Post>>> getPosts() => _postsUseCases.getPosts.launch();
  }

  deleteLike(String idPost) async {
    await _postsUseCases.deleteLike.launch(idPost, id);
  }

}