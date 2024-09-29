
import 'package:injectable/injectable.dart';

import '../../models/post.dart';
import '../../repository/posts_repository.dart';

@Injectable()
class UpdatePostUseCase {

  PostsRepository _repository;

  UpdatePostUseCase(this._repository);

  launch(Post post) => _repository.update(post);

}