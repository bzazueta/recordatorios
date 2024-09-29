import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../models/user_data.dart';
import '../../repository/users_repository.dart';

@Injectable()
class UpdateWithImageUseCase {

  UsersRepository _repository;

  UpdateWithImageUseCase(this._repository);

  launch(UserData userData, File image) => _repository.updateWithImage(userData, image); 

}