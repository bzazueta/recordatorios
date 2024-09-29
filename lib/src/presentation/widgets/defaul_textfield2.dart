import 'package:flutter/material.dart';

class DefaultTextField2 extends StatelessWidget {

  String label;
  String error;
  String? initialValue;
  IconData icon;
  bool obscureText;
  TextEditingController? controller;
  Function(String text) onChanged;
  Color color;

  DefaultTextField2({
    required this.label,
    required this.icon,
    required this.onChanged,
    this.error = '',
    this.initialValue,
    this.obscureText = false,
    this.controller,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(
                color: color
            ),
          ),
          errorText: error,
          suffixIcon: Icon(
            icon,
            color: color,
          )
      ),
      style: TextStyle(
          color: color
      ),
      obscureText: obscureText,

    );
  }
}