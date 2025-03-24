import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pixelfield/constants/app_icon_constants.dart';
import 'package:pixelfield/features/components/widgets/app_icon.dart';
import 'package:pixelfield/theme/app_text_style.dart';
import 'package:pixelfield/theme/palette.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.labelStyle,
    this.inputFormatters,
  });
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = true;

  InputBorder formBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Palette.orange00));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: AppTextStyle.bodySmall
                .copyWith(color: Palette.orange00)
                .latoFont,
          ),
        FormBuilderTextField(
          name: widget.labelText ?? '',
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword ? showPassword : false,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          style:
              AppTextStyle.bodyLarge.copyWith(color: Palette.greyEA).latoFont,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(maxHeight: 32, maxWidth: 40),
            suffixIcon: (widget.isPassword)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                      child: AppIcon(
                        icon: showPassword
                            ? AppIconConstants.eye
                            : AppIconConstants.eyeClosed,
                        color: Palette.orange00,
                        size: 24,
                      ),
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: AppTextStyle.bodyLarge
                .copyWith(color: Palette.greyEA.withValues(alpha: 0.8))
                .latoFont,
            isDense: true,
            contentPadding: EdgeInsets.only(bottom: 8),
            enabledBorder: formBorder,
            focusedBorder: formBorder,
            border: formBorder,
          ),
        )
      ],
    );
  }
}
