import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData icon;
  final String fieldType, label;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.fieldType,
    required this.icon,
    required this.label,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.fieldType == 'password' ? true : false,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
        contentPadding: EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 2),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      autocorrect: false,
    );
  }
}
