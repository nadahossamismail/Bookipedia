import 'package:bookipedia/app/style/app_colors.dart';
import 'package:bookipedia/app/style/app_text_style.dart';
import 'package:bookipedia/cubits/visibility_icon/visibility_cubit.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final bool obscureText;
  final String label;
  final Widget? suffixIcon;
  final bool? isConfirm;

  const AppTextFormField(
      {super.key,
      this.validator,
      this.keyboardType,
      required this.controller,
      this.prefixIcon,
      this.obscureText = false,
      required this.label,
      this.suffixIcon,
      this.isConfirm});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isConfirm == null
          ? obscureText
          : isConfirm!
              ? VisibilityCubit.get(context).visibleConfirmPassword
              : VisibilityCubit.get(context).visiblePassword,
      autocorrect: false,
      enableIMEPersonalizedLearning: false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            )),
        labelText: label,
        prefixIcon: prefixIcon,
        floatingLabelStyle: TextStyle(
            fontSize: FontSize.f20, color: Theme.of(context).hintColor),
        // floatingLabelBehavior: FloatingLabelBehavior.never,

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        suffixIcon: isConfirm == null
            ? suffixIcon
            : isConfirm!
                ? VisibilityCubit.get(context)
                    .visibilityIcon(PasswordOrConfirmation.confirmPassword)
                : VisibilityCubit.get(context)
                    .visibilityIcon(PasswordOrConfirmation.password),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(AppSpacingSizing.s24),
        )),
      ),
    );
  }
}
