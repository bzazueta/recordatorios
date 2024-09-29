
import 'package:injectable/injectable.dart';
import 'package:think_back/src/domain/uses_cases/users/update_image_usecase.dart';
import 'package:think_back/src/domain/uses_cases/users/update_user_usecase.dart';

import 'getuserbyid_usecase.dart';
import 'getuserbyidonce_usecase.dart';

@Injectable()
class UsersUseCase {

  GetUserById getById;
   GetUserByIdOnce getUserByIdOnce;
   UpdateUserUseCase updateWithoutImage;
   UpdateWithImageUseCase updateWithImage;

  UsersUseCase({
    required this.getById, 
    required this.getUserByIdOnce,
    required this.updateWithoutImage,
    required this.updateWithImage,
  });

}