import 'package:injectable/injectable.dart';

import '../../repository/posts_repository.dart';

@Injectable()
class LikePostUseCase {

  PostsRepository _repository;

  LikePostUseCase(this._repository);

  launch(String idPost, String idUser) => _repository.like(idPost, idUser);

}