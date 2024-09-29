import 'package:flutter/material.dart';

import '../../../../domain/models/user_data.dart';
import '../../../../domain/uses_cases/post/posts_usecases.dart';
import '../../../../domain/uses_cases/users/users_usecases.dart';


class PostsDetailViewModel extends ChangeNotifier {

  PostsUseCases _postsUseCases;
  UsersUseCase _usersUseCase;

  PostsDetailViewModel(this._postsUseCases, this._usersUseCase);
  Future<UserData> getUser(String id) => _usersUseCase.getUserByIdOnce.launch(id);

}