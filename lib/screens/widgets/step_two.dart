import 'package:flutter/material.dart';
import 'package:form_ui/core/size.dart';
import 'package:form_ui/core/themes.dart';

class StepTwo extends StatelessWidget {
  final bool obscureText;
  final GlobalKey auth;
  final TextEditingController email;
  final TextEditingController pass;
  final VoidCallback callback;
  const StepTwo({
    super.key,
    required this.callback,
    required this.auth,
    required this.email,
    required this.obscureText,
    required this.pass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            //detail text
            Text(
              'Authentication',
              style: ThemeText.headingDark,
            ),

            //image
            Image.asset(
              'assets/images/auth.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ],
        ),
        heightBox(height: 10),

        //field
        Form(
          key: auth,
          child: Column(
            children: [
              ///[reminder]you can seperate form field as widget as well

              //for email
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please insert an email';
                  }
                  if (!value.contains('@') || !value.contains('.com')) {
                    return 'Please inset a valid email';
                  }
                  return null;
                },
              ),
              heightBox(),

              //for password
              TextFormField(
                controller: pass,
                obscureText: obscureText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length <= 7) {
                    return 'Password must be 8 character';
                  }
                  return null;
                },
              ), //forget passowrd
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: callback,
                    child: Text(
                      obscureText ? 'Show Password' : 'Hide Password',
                      style: ThemeText.paragraphLight
                          .copyWith(color: AppColor.textsecondary),
                    ),
                  ),
                ],
              ),
              heightBox(),
              heightBox(height: -18),
            ],
          ),
        ),
      ],
    );
  }
}
