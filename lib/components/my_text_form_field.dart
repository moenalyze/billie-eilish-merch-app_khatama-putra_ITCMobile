import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String?) onSaved;
  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            // fontWeight: FontWeight.bold
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
          cursorColor: Colors.black,
          validator: (value) {
            if(value == null || value.isEmpty){
              return 'Please fill this field';
            } else if(labelText == 'Email') {
              if(!EmailValidator.validate(value)) {
                return 'Enter a valid email';
              }
              return null;
            }
            return null;
          },
          keyboardType: keyboardType,
          onSaved: onSaved,
        ),
      ],
    );
  }
}