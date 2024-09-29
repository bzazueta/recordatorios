import 'package:firebase_auth/firebase_auth.dart';


import '../models/user_data.dart';
import '../utils/resource.dart';
//aqui se definen los metodos
abstract class AuthRepository {

  User? get user; // usamos un get User de firebase para obtener el usuario de
  Future<Resource> login({required String email, required String password });
  Future<Resource> register(UserData user);
  Future<void> logout();

}