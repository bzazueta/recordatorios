import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:think_back/src/presentation/pages/home/home_viewmodel.dart';
import 'package:think_back/src/presentation/widgets/default_button.dart';

import '../posts/list/post_list_page.dart';
import '../posts/my_list/post_mylist_page.dart';
import '../profile/info/profile_info_page.dart';
import 'widgets/home_bottom_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    ///instaciamos el view model
    HomeViewModel vm = Provider.of<HomeViewModel>(context);
    ///arreglo para las pantallas 1,2,3,...
    final currentTab = [
      PostListPage(),
      PostMyListPage(),
      ProfileInfoPage()
    ];
    return  Scaffold(
      // body: Center(
      //   child: DefaultButton(
      //     text: 'Cerrar sesion',
      //     onPressed: () async{
      //       await vm.logout();
      //       Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
      //     },
      //   ),
      // ),
      body: currentTab[vm.currentIndex],
      bottomNavigationBar: HomeBottomBar(context, vm),
    );
  }
}
