import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../repository/auth_repository.dart';

@Injectable()
class UserSessionUseCase {

  AuthRepository _repository;

  UserSessionUseCase(this._repository);///inyectamos el AuthRepository

  User? get userSession => this._repository.user;///obtenemos el user de AuthRepository

}