
import 'package:injectable/injectable.dart';

import '../../models/user_data.dart';
import '../../repository/users_repository.dart';
import '../../utils/resource.dart';

@Injectable()
class GetUserById {

  UsersRepository _repository;

  GetUserById(this._repository);

  Stream<Resource<UserData>> launch(String id) => _repository.getUserById(id);

}