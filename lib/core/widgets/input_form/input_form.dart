import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/colors/app_colors.dart';
import 'input_form_validator.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    Key? key,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.errorText,
    this.isSecret = false,
    this.isReadOnly = false,
    this.validators,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.onChanged,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final bool isSecret;
  final Widget? suffixIcon;
  final bool isReadOnly;
  final List<InputValidator>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final FocusNode? focusNode;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool isObscure = true;

  Widget _buildSecretIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isObscure = !isObscure;
        });
      },
      child: Icon(
        isObscure == true
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: mentheSecondaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator: InputFormValidators.compose(widget.validators ?? []),
      readOnly: widget.isReadOnly,
      obscureText: widget.isSecret == true ? isObscure : false,
      controller: widget.controller,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: blueDarkPrimaryColor,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        counterText: '',
        suffixIcon:
        widget.suffixIcon ?? (widget.isSecret ? _buildSecretIcon() : null),
        hintText: widget.hintText,
      ),
    );
  }
}
