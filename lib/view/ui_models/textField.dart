import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    @required this.textFieldIcon,
    required this.fieldName,
    required this.onSaved,
    this.txtFieldValidater,
  });

  Function(String?)? onSaved;
  Icon? textFieldIcon;
  String? fieldName;
  String? Function(String?)? txtFieldValidater;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onChanged: onSaved,
        validator: txtFieldValidater,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 19,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          focusColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          label: Text(
            fieldName!,
            style: const TextStyle(fontSize: 17),
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 25, right: 15),
              child: textFieldIcon),
          prefixIconColor: Colors.black,
        ),
      ),
    );
  }
}
