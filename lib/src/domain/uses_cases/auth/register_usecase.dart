
import 'package:injectable/injectable.dart';

import '../../models/user_data.dart';
import '../../repository/auth_repository.dart';

@Injectable()
class RegisterUseCase {

  AuthRepository _repository;

  RegisterUseCase(this._repository);

  launch(UserData user) => _repository.register(user);

}