// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_storage/firebase_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:think_back/src/data/repository/auth_repository_impl.dart'
    as _i20;
import 'package:think_back/src/data/repository/posts_repository_impl.dart'
    as _i29;
import 'package:think_back/src/data/repository/users_repository_impl.dart'
    as _i18;
import 'package:think_back/src/di/app_module.dart' as _i32;
import 'package:think_back/src/di/firebase_service.dart' as _i7;
import 'package:think_back/src/domain/repository/auth_repository.dart' as _i3;
import 'package:think_back/src/domain/repository/posts_repository.dart' as _i11;
import 'package:think_back/src/domain/repository/users_repository.dart' as _i17;
import 'package:think_back/src/domain/uses_cases/auth/auth_usecases.dart'
    as _i4;
import 'package:think_back/src/domain/uses_cases/auth/login_usecase.dart'
    as _i9;
import 'package:think_back/src/domain/uses_cases/auth/logout_usecase.dart'
    as _i10;
import 'package:think_back/src/domain/uses_cases/auth/register_usecase.dart'
    as _i13;
import 'package:think_back/src/domain/uses_cases/auth/user_session_usecase.dart'
    as _i16;
import 'package:think_back/src/domain/uses_cases/post/create_post_usecase.dart'
    as _i21;
import 'package:think_back/src/domain/uses_cases/post/delete_like_post_usecase.dart'
    as _i22;
import 'package:think_back/src/domain/uses_cases/post/delete_post_usecase.dart'
    as _i23;
import 'package:think_back/src/domain/uses_cases/post/get_posts_by_id_usecase.dart'
    as _i24;
import 'package:think_back/src/domain/uses_cases/post/get_posts_usecase.dart'
    as _i25;
import 'package:think_back/src/domain/uses_cases/post/like_post_usecase.dart'
    as _i28;
import 'package:think_back/src/domain/uses_cases/post/posts_usecases.dart'
    as _i12;
import 'package:think_back/src/domain/uses_cases/post/update_post_image_usecase.dart'
    as _i14;
import 'package:think_back/src/domain/uses_cases/post/update_post_usecase.dart'
    as _i15;
import 'package:think_back/src/domain/uses_cases/users/getuserbyid_usecase.dart'
    as _i26;
import 'package:think_back/src/domain/uses_cases/users/getuserbyidonce_usecase.dart'
    as _i27;
import 'package:think_back/src/domain/uses_cases/users/update_image_usecase.dart'
    as _i31;
import 'package:think_back/src/domain/uses_cases/users/update_user_usecase.dart'
    as _i30;
import 'package:think_back/src/domain/uses_cases/users/users_usecases.dart'
    as _i19;

const String _Repositories = 'Repositories';
const String _UseCases = 'UseCases';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AuthRepository>(
      () => appModule.authRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i4.AuthUseCases>(
      () => appModule.authUsesCase,
      registerFor: {_UseCases},
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.usersRef,
      instanceName: 'Users',
    );
    gh.factory<_i5.CollectionReference<Object?>>(
      () => appModule.postsRef,
      instanceName: 'Posts',
    );
    gh.factory<_i6.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(() => appModule.firebaseFirestore);
    await gh.factoryAsync<_i7.FirebaseService>(
      () => appModule.firebaseService,
      preResolve: true,
    );
    gh.factory<_i8.FirebaseStorage>(() => appModule.firebaseStorage);
    gh.factory<_i9.LoginUseCase>(
        () => _i9.LoginUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i10.LogoutUseCase>(
        () => _i10.LogoutUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i11.PostsRepository>(
      () => appModule.postsRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i12.PostsUseCases>(
      () => appModule.postsUseCases,
      registerFor: {_UseCases},
    );
    gh.factory<_i8.Reference>(
      () => appModule.usersStorageRef,
      instanceName: 'Users',
    );
    gh.factory<_i8.Reference>(
      () => appModule.postsStorageRef,
      instanceName: 'Posts',
    );
    gh.factory<_i13.RegisterUseCase>(
        () => _i13.RegisterUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i14.UpdatePostImageUseCase>(
        () => _i14.UpdatePostImageUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i15.UpdatePostUseCase>(
        () => _i15.UpdatePostUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i16.UserSessionUseCase>(
        () => _i16.UserSessionUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i17.UsersRepository>(() => _i18.UsersRepositoryImpl(
          gh<_i5.CollectionReference<Object?>>(instanceName: 'Users'),
          gh<_i8.Reference>(instanceName: 'Users'),
        ));
    gh.factory<_i17.UsersRepository>(
      () => appModule.usersRepository,
      registerFor: {_Repositories},
    );
    gh.factory<_i19.UsersUseCase>(
      () => appModule.usersUseCases,
      registerFor: {_UseCases},
    );
    gh.factory<_i3.AuthRepository>(() => _i20.AuthRepositoryImpl(
          gh<_i6.FirebaseAuth>(),
          gh<_i5.CollectionReference<Object?>>(instanceName: 'Users'),
        ));
    gh.factory<_i4.AuthUseCases>(() => _i4.AuthUseCases(
          login: gh<_i9.LoginUseCase>(),
          register: gh<_i13.RegisterUseCase>(),
          getUser: gh<_i16.UserSessionUseCase>(),
          logout: gh<_i10.LogoutUseCase>(),
        ));
    gh.factory<_i21.CreatePostUseCase>(
        () => _i21.CreatePostUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i22.DeleteLikePostUseCase>(
        () => _i22.DeleteLikePostUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i23.DeletePostUseCase>(
        () => _i23.DeletePostUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i24.GetPostsByIdUseCase>(
        () => _i24.GetPostsByIdUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i25.GetPostsUseCase>(
        () => _i25.GetPostsUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i26.GetUserById>(
        () => _i26.GetUserById(gh<_i17.UsersRepository>()));
    gh.factory<_i27.GetUserByIdOnce>(
        () => _i27.GetUserByIdOnce(gh<_i17.UsersRepository>()));
    gh.factory<_i28.LikePostUseCase>(
        () => _i28.LikePostUseCase(gh<_i11.PostsRepository>()));
    gh.factory<_i11.PostsRepository>(() => _i29.PostsRepositoryImpl(
          gh<_i5.CollectionReference<Object?>>(instanceName: 'Posts'),
          gh<_i8.Reference>(instanceName: 'Posts'),
        ));
    gh.factory<_i12.PostsUseCases>(() => _i12.PostsUseCases(
          create: gh<_i21.CreatePostUseCase>(),
          getPosts: gh<_i25.GetPostsUseCase>(),
          update: gh<_i15.UpdatePostUseCase>(),
          updateWithImage: gh<_i14.UpdatePostImageUseCase>(),
          getPostsById: gh<_i24.GetPostsByIdUseCase>(),
          delete: gh<_i23.DeletePostUseCase>(),
          like: gh<_i28.LikePostUseCase>(),
          deleteLike: gh<_i22.DeleteLikePostUseCase>(),
        ));
    gh.factory<_i30.UpdateUserUseCase>(
        () => _i30.UpdateUserUseCase(gh<_i17.UsersRepository>()));
    gh.factory<_i31.UpdateWithImageUseCase>(
        () => _i31.UpdateWithImageUseCase(gh<_i17.UsersRepository>()));
    gh.factory<_i19.UsersUseCase>(() => _i19.UsersUseCase(
          getById: gh<_i26.GetUserById>(),
          getUserByIdOnce: gh<_i27.GetUserByIdOnce>(),
          updateWithoutImage: gh<_i30.UpdateUserUseCase>(),
          updateWithImage: gh<_i31.UpdateWithImageUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i32.AppModule {}
