
import 'dart:io';

import 'package:think_back/src/domain/utils/resource.dart';

import '../models/user_data.dart';

abstract class UsersRepository{

  ///stream clase que nos permite obtener los datos en tiempo real
  Stream<Resource<UserData>> getUserById(String id);
  Future<UserData> getUserByIdOnce(String id);
  Future<Resource<String>> updateWithoutImage(UserData userData);
  Future<Resource<String>> updateWithImage(UserData userData, File image);
}