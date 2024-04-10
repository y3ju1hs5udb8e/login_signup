import 'package:flutter/material.dart';
import 'package:form_ui/core/size.dart';
import 'package:form_ui/core/themes.dart';

class StepOne extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController conact;
  final TextEditingController age;
  final GlobalKey keyT;
  const StepOne({
    super.key,
    required this.age,
    required this.conact,
    required this.name,
    required this.keyT,
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
              'Personal Details',
              style: ThemeText.headingDark,
            ),

            //image
            Image.asset(
              'assets/images/sign_up.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ],
        ),
        heightBox(height: 10),

        //field
        Form(
          key: keyT,
          child: Column(
            children: [
              ///[reminder]you can seperate form field as widget as well

              //for email
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Full Name',
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
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              heightBox(),

              //for password
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: conact,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: 'Contact',
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
                          return 'Please your contact number';
                        }
                        if (value.length < 10) {
                          return 'Please number cant be less than 10';
                        }
                        return null;
                      },
                    ),
                  ),
                  widthBox(),
                  Expanded(
                    child: TextFormField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.numbers),
                        labelText: 'Age',
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
                          return 'Please your age';
                        }
                        if (int.parse(value) > 90) {
                          return 'Are you a ghost?';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              heightBox(height: -18),
            ],
          ),
        ),
      ],
    );
  }
}
