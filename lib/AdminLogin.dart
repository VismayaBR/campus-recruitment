import 'package:campus_recruitment_admin/Dashboard.dart';
import 'package:campus_recruitment_admin/colors/colors.dart';
import 'package:campus_recruitment_admin/customwidgets/appText.dart';
import 'package:campus_recruitment_admin/customwidgets/customTextField.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var email = TextEditingController();
  var password = TextEditingController();

  void login() {
    if (email.text == 'admin@gmail.com' && password.text == 'Admin@123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Dashboard();
        },
      ));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid login credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              width: 500,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 28),
                    child: AppText(
                        text: 'LOGIN',
                        weight: FontWeight.w400,
                        size: 25,
                        textcolor: white),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 60, right: 60, top: 18),
                        child: CustomTextField(
                            hint: 'Email Address',
                            controller: email,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter Email';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 60, right: 60, top: 18),
                        child: CustomTextField(
                            hint: 'Password',
                            controller: password,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Please enter Password';
                              }
                              return null;
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: InkWell(
                      onTap: () {
                        
                        login();
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return Dashboard();
                        //   },
                        // ));
                      },
                      child: Container(
                        height: 40,
                        color: Color.fromARGB(255, 8, 35, 170),
                        child: Center(
                          child: AppText(
                              text: 'Login',
                              weight: FontWeight.w500,
                              size: 20,
                              textcolor: white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
