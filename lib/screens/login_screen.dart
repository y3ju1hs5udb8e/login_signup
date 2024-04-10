import 'package:flutter/material.dart';
import 'package:form_ui/core/size.dart';
import 'package:form_ui/core/themes.dart';
import 'package:form_ui/screens/widgets/common_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final obScureText = true;
  final isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white24, BlendMode.lighten),
              image: AssetImage('assets/images/bg_image.jpg'),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                heightBox(height: 50),
                //login text
                Text(
                  'Login.',
                  style: ThemeText.headingDark.copyWith(fontSize: 30),
                ),
                heightBox(height: 10),

                //login image
                Image.asset(
                  'assets/images/login_image.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                heightBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ///[reminder]you can seperate form field as widget as well

                      //for email
                      TextFormField(
                        controller: _emailController,
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
                        controller: _passwordController,
                        obscureText: obScureText,
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
                          return null;
                        },
                      ),
                      heightBox(height: -18),

                      //forget passowrd
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password',
                              style: ThemeText.paragraphLight
                                  .copyWith(color: AppColor.textsecondary),
                            ),
                          ),
                        ],
                      ),
                      heightBox(),

                      //button submit
                      CommonButton(
                        func: () {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {}
                        },
                        text: 'Login',
                      ),
                      heightBox(height: -15),

                      //signup option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: ThemeText.paragraphLight
                                .copyWith(color: AppColor.textPrimary),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign up',
                              style: ThemeText.paragraphLight
                                  .copyWith(color: AppColor.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
