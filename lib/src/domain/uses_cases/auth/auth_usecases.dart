
import 'package:injectable/injectable.dart';
import 'package:think_back/src/domain/uses_cases/auth/login_usecase.dart';
import 'package:think_back/src/domain/uses_cases/auth/register_usecase.dart';
import 'package:think_back/src/domain/uses_cases/auth/user_session_usecase.dart';

import 'logout_usecase.dart';
/// en este archivo se agregan todos los casos de uso
@Injectable()
class AuthUseCases {

   late LoginUseCase login;
   RegisterUseCase register;
   UserSessionUseCase getUser;
   LogoutUseCase logout;
  //
   AuthUseCases({
     required this.login,
     required this.register,
     required this.getUser,
     required this.logout
   });

}