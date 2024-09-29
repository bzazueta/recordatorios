import 'package:flutter/material.dart';

import '../home_viewmodel.dart';

class HomeBottomBar extends StatelessWidget {
  
  HomeViewModel vm;
  BuildContext context;

  HomeBottomBar(this.context, this.vm);///recibimos el vm

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: vm.currentIndex, ///pasamos el valor del vm
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey[400],  
      onTap: (index) {
        vm.currentIndex = index;///pasamos el nuevo valor seleccionado del bottom vavigation bar
      },
      items: const [
        BottomNavigationBarItem(          
          icon: Icon(
            Icons.list,
            color: Colors.white,
          ),
          label: 'Posts'
        ),
        BottomNavigationBarItem(          
          icon: Icon(
            Icons.list_alt,
            color: Colors.white,
          ),
          label: 'My Posts'
        ),
        BottomNavigationBarItem(          
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),           
          label: 'Profile'
        ),
      ]
    );
  }
}