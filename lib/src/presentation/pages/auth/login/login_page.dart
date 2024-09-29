import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../../../injection.dart';
import '../../../../../main.dart';
import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/utils/resource.dart';
import 'login_viewmodel.dart';
import 'widgets/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    LoginViewModel vm = Provider.of<LoginViewModel>(context);



    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          StreamBuilder(
              stream: vm.response,
              builder: (context, snapshot) {
                final response = snapshot.data;
                if (response is Loading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (response is Error) {
                  final data = response as Error;
                  Fluttertoast.showToast(
                      msg: 'Error: ${data.error}',
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 3
                  );
                }
                else if (response is Success) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {///esta linea siempre se usa cuando usamos navigator
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp(locator<AuthUseCases>()),),
                            (route) => false
                    );
                  });
                }
                return Container();
              }
          ),
          LoginContent(vm)
        ],
      ),
    );
  }
}

