import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/domain/models/user_data.dart';
import 'package:think_back/src/presentation/pages/profile/update/profile_update_response.dart';
import 'package:think_back/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import 'package:think_back/src/presentation/pages/profile/update/widgets/profile_update_content.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});




  @override
  Widget build(BuildContext context) {

    ProfileUpdateViewModel vm = Provider.of<ProfileUpdateViewModel>(context);
    UserData userDataArg = ModalRoute.of(context)?.settings.arguments as UserData;//recuperamos los argumentos pasados por rutas
    //vm.loadData(userDataArg);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     ProfileUpdateResponse(context, vm);
    }); // CUANDO TODOS LOS ELEMENTOS YA HAN SIDO MOSTRADOS EN PANATALLAS
    return Scaffold(
      body: ProfileUpdateContent(vm,userDataArg),
    );
  }
}
