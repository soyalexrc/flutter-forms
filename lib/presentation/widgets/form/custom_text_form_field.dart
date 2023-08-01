import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.obscureText = false,
    this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder();
    final colors = Theme
        .of(context)
        .colorScheme;

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
        border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        icon:
        Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        prefixIcon:
        Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        suffixIcon:
        Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        errorText: errorMessage,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
        border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
      ),
    );
  }
}
