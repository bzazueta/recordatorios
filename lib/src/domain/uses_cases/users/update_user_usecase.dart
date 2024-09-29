
import 'package:injectable/injectable.dart';

import '../../models/user_data.dart';
import '../../repository/users_repository.dart';

@Injectable()
class UpdateUserUseCase {

  UsersRepository _repository;

  UpdateUserUseCase(this._repository);

  launch(UserData userData) => _repository.updateWithoutImage(userData);

}