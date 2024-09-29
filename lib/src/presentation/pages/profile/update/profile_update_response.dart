import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:think_back/src/presentation/pages/profile/update/profile_update_viewmodel.dart';

import '../../../../domain/utils/resource.dart';
import '../../../utils/show_dialog.dart';

class ProfileUpdateResponse {

  BuildContext context;
  ProfileUpdateViewModel vm;

  ProfileUpdateResponse(this.context, this.vm) {
    if (vm.response is Loading) {
      buildShowDialog(context);
    }
    else if (vm.response is Error) {
      final data = vm.response as Error;
      Navigator.pop(context);//cierra el dialogo
      Fluttertoast.showToast(
        msg: data.error,
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG
      );
      vm.resetResponse();
    }
    else if (vm.response is Success) {
      final success = vm.response as Success<String>;
      Navigator.pop(context);
      Fluttertoast.showToast(
        msg: success.data,
        timeInSecForIosWeb: 3,
        toastLength: Toast.LENGTH_LONG
      );
      vm.resetResponse();
    }
  }

}