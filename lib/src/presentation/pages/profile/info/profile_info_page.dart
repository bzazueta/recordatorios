import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:think_back/src/presentation/pages/profile/info/widgets/profile_info_content.dart';

import '../../../../domain/models/user_data.dart';
import '../../../../domain/utils/resource.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileInfoViewModel vm = Provider.of<ProfileInfoViewModel>(context);
    return  Scaffold(
      body: StreamBuilder(
          stream: vm.getUserById(),///cargamos  la informacion del vm
          builder: ((context, snapshot) { /// snapshot -> nos trae la informacion del vm
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No hay informacion'),
              );
            }
            final response = snapshot.data;
            if (response is Error) {
              final data = response as Error;
              return Center(
                child: Text('Error: ${data.error}'),
              );
            }
            final success = response as Success<UserData>;
            return ProfileInfoContent(vm, success.data);
          })
      )
    );
  }
}
