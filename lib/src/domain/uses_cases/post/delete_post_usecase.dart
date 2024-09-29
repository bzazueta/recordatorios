import 'package:injectable/injectable.dart';
import '../../repository/posts_repository.dart';

@Injectable()
class DeletePostUseCase {

  PostsRepository _repository;

  DeletePostUseCase(this._repository);

  launch(String idPost) => _repository.delete(idPost);

}