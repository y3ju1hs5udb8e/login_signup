import 'package:flutter/material.dart';
import 'package:form_ui/core/themes.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback func;
  const CommonButton({
    super.key,
    required this.func,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: func,
      style: FilledButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: const Size(350, 60),
      ),
      child: Text(
        text,
        style: ThemeText.headingDark,
      ),
    );
  }
}
