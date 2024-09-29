
import 'package:injectable/injectable.dart';
import 'package:think_back/src/domain/uses_cases/post/update_post_image_usecase.dart';
import 'package:think_back/src/domain/uses_cases/post/update_post_usecase.dart';
import 'create_post_usecase.dart';
import 'delete_like_post_usecase.dart';
import 'delete_post_usecase.dart';
import 'get_posts_by_id_usecase.dart';
import 'get_posts_usecase.dart';
import 'like_post_usecase.dart';

@Injectable()
class PostsUseCases {

  CreatePostUseCase create;
  GetPostsUseCase getPosts;
  UpdatePostUseCase update;
  UpdatePostImageUseCase updateWithImage;
  GetPostsByIdUseCase getPostsById;
  DeletePostUseCase delete;
  LikePostUseCase like;
  DeleteLikePostUseCase deleteLike;

  PostsUseCases({
     required this.create,
     required this.getPosts,
     required this.update,
     required this.updateWithImage,
     required this.getPostsById,
     required this.delete,
     required this.like,
     required this.deleteLike,
  });

}

