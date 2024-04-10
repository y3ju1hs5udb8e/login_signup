import 'package:flutter/material.dart';
import 'package:form_ui/core/size.dart';
import 'package:form_ui/core/themes.dart';
import 'package:form_ui/screens/login_screen.dart';
import 'package:form_ui/screens/widgets/common_button.dart';
import 'package:form_ui/screens/widgets/step_one.dart';
import 'package:form_ui/screens/widgets/step_two.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _detailKey = GlobalKey<FormState>();
  final _authKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obScureText = true;

  int currentStep = 0;

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
          child: ListView(
            children: [
              heightBox(height: 20),
              //text
              Text(
                'Signup.',
                textAlign: TextAlign.center,
                style: ThemeText.headingDark.copyWith(fontSize: 35),
              ),

              //signup form
              Stepper(
                currentStep: currentStep,
                steps: steps(),
                onStepContinue: () {
                  final lastStep = steps().length - 1;

                  if (currentStep != lastStep) {
                    setState(() => currentStep++);
                  }
                },
                onStepCancel: () {
                  if (currentStep != 0) {
                    setState(() => currentStep--);
                  }
                },
                controlsBuilder: (context, details) {
                  return Container(
                    padding: const EdgeInsets.only(top: 35),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            if (currentStep != 0)
                              Expanded(
                                child: CommonButton(
                                  func: details.onStepCancel,
                                  text: 'Back',
                                ),
                              ),
                            widthBox(),
                            Expanded(
                              child: CommonButton(
                                func: currentStep != steps().length - 1
                                    ? details.onStepContinue
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (_detailKey.currentState!
                                            .validate()) {
                                          if (_authKey.currentState!
                                              .validate()) {
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Loook like authenticated wrong data'),
                                              ),
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Look like you have entered wrong data'),
                                            ),
                                          );
                                        }
                                      },
                                text: currentStep != steps().length - 1
                                    ? 'Next'
                                    : 'Submit',
                              ),
                            ),
                          ],
                        ),
                        //login option
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Already have an account?',
                              style: ThemeText.paragraphLight
                                  .copyWith(color: AppColor.textPrimary),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: ThemeText.paragraphLight
                                    .copyWith(color: AppColor.primary),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> steps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Details'),
          content: StepOne(
            age: _ageController,
            conact: _contactController,
            name: _nameController,
            keyT: _detailKey,
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Authentication'),
          content: StepTwo(
            callback: () {
              setState(() {
                obScureText = !obScureText;
              });
            },
            auth: _authKey,
            email: _emailController,
            obscureText: obScureText,
            pass: _passwordController,
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('User Address'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(height: 10),
              //image
              Image.asset(
                'assets/images/done.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.contain,
              ),
              heightBox(height: -10),
              _text("Name: ${_nameController.text}"),
              _text("Age: ${_ageController.text}"),
              _text("Contact: ${_contactController.text}"),
              _text("Email: ${_emailController.text}"),
            ],
          ),
        ),
      ];

  Widget _text(String text) {
    return Column(
      children: [
        Text(
          text,
          style: ThemeText.paragraphDark,
        ),
        heightBox(height: -10),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
