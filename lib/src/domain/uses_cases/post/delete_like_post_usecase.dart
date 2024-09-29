import 'package:injectable/injectable.dart';

import '../../repository/posts_repository.dart';

@Injectable()
class DeleteLikePostUseCase {

  PostsRepository _repository;

  DeleteLikePostUseCase(this._repository);

  launch(String idPost, String idUser) => _repository.deleteLike(idPost, idUser);

}