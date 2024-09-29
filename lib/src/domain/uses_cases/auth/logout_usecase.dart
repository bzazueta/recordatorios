import 'package:injectable/injectable.dart';

import '../../repository/auth_repository.dart';

@Injectable()
class LogoutUseCase {

  AuthRepository _repository;

  LogoutUseCase(this._repository);

  launch() => _repository.logout();

}