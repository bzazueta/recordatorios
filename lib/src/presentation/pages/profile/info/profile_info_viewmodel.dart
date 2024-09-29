import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:think_back/src/domain/models/user_data.dart';
import 'package:think_back/src/domain/utils/resource.dart';

import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/uses_cases/users/users_usecases.dart';

class ProfileInfoViewModel extends ChangeNotifier {

   UsersUseCase _usersUseCase;
   AuthUseCases _authUseCases;
  //
  ProfileInfoViewModel(this._usersUseCase, this._authUseCases) {
    getUserById();
  }
  //
   Stream<Resource<UserData>> getUserById() {
    final id = _authUseCases.getUser.userSession?.uid ?? '';
    // _usersUseCase.getById.launch(id).listen((Resource<UserData> response) {
    //   if(response is Loading) {
    //
    //   }
    //   else if(response is Error){
    //     final data = response as Error;
    //     print('Error : ${data}');
    //
    //   }else if(response is Success){
    //     final data = response as Success<UserData>;
    //      print('Success : ${data.data.toJson()}');
    //   }
    //
    // });
    return _usersUseCase.getById.launch(id);
  }

  logout() async {
    await _authUseCases.logout.launch();
  }

}