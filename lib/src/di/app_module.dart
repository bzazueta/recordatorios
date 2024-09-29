

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:think_back/src/domain/repository/users_repository.dart';
import 'package:think_back/src/domain/uses_cases/auth/logout_usecase.dart';
import 'package:think_back/src/domain/uses_cases/auth/user_session_usecase.dart';
import '../core/constants.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/posts_repository_impl.dart';
import '../data/repository/users_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/posts_repository.dart';
import '../domain/uses_cases/auth/auth_usecases.dart';
import '../domain/uses_cases/auth/login_usecase.dart';
import '../domain/uses_cases/auth/register_usecase.dart';
import '../domain/uses_cases/post/create_post_usecase.dart';
import '../domain/uses_cases/post/delete_like_post_usecase.dart';
import '../domain/uses_cases/post/delete_post_usecase.dart';
import '../domain/uses_cases/post/get_posts_by_id_usecase.dart';
import '../domain/uses_cases/post/get_posts_usecase.dart';
import '../domain/uses_cases/post/like_post_usecase.dart';
import '../domain/uses_cases/post/posts_usecases.dart';
import '../domain/uses_cases/post/update_post_image_usecase.dart';
import '../domain/uses_cases/post/update_post_usecase.dart';
import '../domain/uses_cases/users/getuserbyid_usecase.dart';
import '../domain/uses_cases/users/getuserbyidonce_usecase.dart';
import '../domain/uses_cases/users/update_image_usecase.dart';
import '../domain/uses_cases/users/update_user_usecase.dart';
import '../domain/uses_cases/users/users_usecases.dart';
import 'firebase_service.dart';
//inyeccion de depencias
@module
abstract class AppModule {

  @preResolve //@preResolve indica que es un servicio prioritario cuando inicie la app
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable // @injectable se agrega esta etiqueta para poder inyectar en otras clases  o archivos. get regresa el valor
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;///para poder loguarnos con firbase

  @injectable
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance; ///para poder almmacenar imagenes

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @Named(USERS)
  @injectable
  CollectionReference get usersRef => firebaseFirestore.collection(USERS);///crea una coleccion llamada user en firestore

  @Named(USERS)
  @injectable
  Reference get usersStorageRef => firebaseStorage.ref().child(USERS);///guarda la imagen en una carpeta llamada user


  @Named(POSTS)
  @injectable
  CollectionReference get postsRef => firebaseFirestore.collection(POSTS);

  @Named(POSTS)
  @injectable
  Reference get postsStorageRef => firebaseStorage.ref().child(POSTS);

  @Environment(REPOSITORIES)
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(firebaseAuth,usersRef);//se impelmentan los metodos

  @Environment(REPOSITORIES)
  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersRef,usersStorageRef);//se impelmentan los metodos

  @Environment(REPOSITORIES)
  @injectable
  PostsRepository get postsRepository => PostsRepositoryImpl(postsRef, postsStorageRef);

  @Environment(USE_CASES)
  @injectable
  AuthUseCases get authUsesCase => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUser: UserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository)
  );//se impelmentan los metodos LoginUseCas


  @Environment(USE_CASES)
  @injectable
  UsersUseCase get usersUseCases => UsersUseCase(
    getById: GetUserById(usersRepository),
      getUserByIdOnce: GetUserByIdOnce(usersRepository),
     updateWithoutImage: UpdateUserUseCase(usersRepository),
     updateWithImage: UpdateWithImageUseCase(usersRepository)
  );


  @Environment(USE_CASES)
  @injectable
  PostsUseCases get postsUseCases => PostsUseCases(
    create: CreatePostUseCase(postsRepository),
    getPosts: GetPostsUseCase(postsRepository),
    getPostsById: GetPostsByIdUseCase(postsRepository),
    delete: DeletePostUseCase(postsRepository),
    update: UpdatePostUseCase(postsRepository),
    updateWithImage: UpdatePostImageUseCase(postsRepository),
    like: LikePostUseCase(postsRepository),
    deleteLike: DeleteLikePostUseCase(postsRepository)
  );



  //
  // @Environment(REPOSITORIES)

  // @Environment(REPOSITORIES)
  // @injectable
  // UsersRepository get usersRepository => UsersRepositoryImpl(usersRef, usersStorageRef);
  //

  //
  // @Environment(USE_CASES)
  // @injectable
  // AuthUseCases get authUseCases => AuthUseCases(
  //   login: LoginUseCase(authRepository),
  //   register: RegisterUseCase(authRepository),
  //   getUser: UserSessionUseCase(authRepository),
  //   logout: LogoutUseCase(authRepository)
  // );
  //
  // @Environment(USE_CASES)
  // @injectable
  // UsersUseCase get usersUseCases => UsersUseCase(
  //   getById: GetUserById(usersRepository),
  //   getUserByIdOnce: GetUserByIdOnce(usersRepository),
  //   updateWithoutImage: UpdateUserUseCase(usersRepository),
  //   updateWithImage: UpdateWithImageUseCase(usersRepository)
  // );
  //


}