import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../../injection.dart';
import '../../../../../main.dart';
import '../../../../domain/uses_cases/auth/auth_usecases.dart';
import '../../../../domain/utils/resource.dart';
import 'register_viewmodel.dart';
import 'widgets/register_content.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    RegisterViewModel vm = Provider.of<RegisterViewModel>(context);

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
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
          RegisterContent(vm)
        ],
      ),
    );
  }
}
