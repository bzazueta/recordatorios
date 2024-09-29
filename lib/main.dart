
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/domain/uses_cases/post/posts_usecases.dart';
import 'package:think_back/src/domain/uses_cases/users/users_usecases.dart';
import 'package:think_back/src/presentation/pages/posts/create/post_create_page.dart';
import 'package:think_back/src/presentation/pages/posts/create/posts_create_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/detail/posts_detail_page.dart';
import 'package:think_back/src/presentation/pages/posts/list/posts_list_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/my_list/posts_my_list_viewmodel.dart';
import 'package:think_back/src/presentation/pages/posts/update/posts_update_page.dart';
import 'package:think_back/src/presentation/pages/posts/update/posts_update_viewmodel.dart';
import 'package:think_back/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:think_back/src/presentation/pages/profile/update/profile_update_page.dart';
import 'package:think_back/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import '/src/domain/uses_cases/auth/auth_usecases.dart';
import '/src/presentation/pages/home/home_page.dart';
import 'injection.dart';
import 'src/presentation/pages/auth/login/login_page.dart';
import 'src/presentation/pages/auth/login/login_viewmodel.dart';
import 'src/presentation/pages/auth/register/register_page.dart';
import 'src/presentation/pages/auth/register/register_viewmodel.dart';
import 'src/presentation/pages/home/home_viewmodel.dart';
import 'src/presentation/pages/posts/detail/posts_detail_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependecies();//inicializamos la inyeccion de dependencias del archivo injection
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp(locator<AuthUseCases>()));///inyectamos el caso de uso
}

class MyApp extends StatelessWidget {
  AuthUseCases _authUseCases;///se agrega el caso de uso en el main porque hay que eliminar los valores
  ///del estado al cerra sesion hay que informale al provider que de restablecerse restablecer los valores
  MyApp(this._authUseCases);///inyectamos el caso de uso

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String idSession = _authUseCases.getUser.userSession?.uid ?? '';

    return MultiProvider(//envolvemos el widget principal en el multiprovider
      key: Key(idSession),///le pasamo una llave diferente y con key le indicamos que queremos reinicar los estados el provider con el idsession
      providers: [
        ChangeNotifierProvider(create: (context)=> LoginViewModel(locator<AuthUseCases>())),//ChangeNotifierProvider le pasamo el viewmodel que es que provee los datos atravez de los casos de usos y inyectamos las dependencias locator<AuthUseCases>() para poder ser usada en LoginViewModel
        ChangeNotifierProvider(create: (context)=> RegisterViewModel(locator<AuthUseCases>())),//le pasamo el viewmodel que es que provee lod datos
        ChangeNotifierProvider(create: (context)=> HomeViewModel(locator<AuthUseCases>())),//le pasamo el viewmodel que es que provee lod datos
        ChangeNotifierProvider(create: (context)=> ProfileInfoViewModel(locator<UsersUseCase>(),locator<AuthUseCases>())),//le pasamo el viewmodel que es que provee lod datos
        ChangeNotifierProvider(create: (context)=> ProfileUpdateViewModel(locator<UsersUseCase>())),//le pasamo el viewmodel que es que provee lod datos
        ChangeNotifierProvider(create: (context) => PostsCreateViewModel(locator<AuthUseCases>(), locator<PostsUseCases>())),
        ChangeNotifierProvider(create: (context) => PostsListViewModel(locator<AuthUseCases>(), locator<PostsUseCases>(), locator<UsersUseCase>())),
        ChangeNotifierProvider(create: (context) => PostsDetailViewModel(locator<PostsUseCases>(), locator<UsersUseCase>())),
        ChangeNotifierProvider(create: (context) => PostsMyListViewModel(locator<AuthUseCases>(), locator<PostsUseCases>())),
        ChangeNotifierProvider(create: (context) => PostsUpdateViewModel(locator<AuthUseCases>(), locator<PostsUseCases>())),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: idSession.isEmpty ? 'login' : 'home',
        routes:  {
          'login' : (BuildContext context)=> LoginPage(),
          'register' : (BuildContext context)=> RegisterPage(),
          'home' : (BuildContext context)=> HomePage(),
          'profile/update' : (BuildContext context)=> ProfileUpdatePage(),
          'post/create' : (BuildContext context)=> PostCreatePage(),
          'posts/detail' : (BuildContext context) => PostsDetailPage(),
          'posts/update' : (BuildContext context) => PostsUpdatePage(),
        },
      ),
    );
  }
}
