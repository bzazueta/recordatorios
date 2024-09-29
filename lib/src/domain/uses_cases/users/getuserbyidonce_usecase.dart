import 'package:injectable/injectable.dart';

import '../../repository/users_repository.dart';

@Injectable()
class GetUserByIdOnce {

  UsersRepository _repository;

  GetUserByIdOnce(this._repository);

  launch(String id) => _repository.getUserByIdOnce(id);

}