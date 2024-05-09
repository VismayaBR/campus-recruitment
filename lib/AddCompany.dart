import 'package:campus_recruitment_admin/AdminLogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:campus_recruitment_admin/Dashboard.dart';
import 'package:campus_recruitment_admin/Users.dart';
import 'package:campus_recruitment_admin/company.dart';
import 'package:campus_recruitment_admin/colors/colors.dart';
import 'package:campus_recruitment_admin/customwidgets/appText.dart';
import 'package:campus_recruitment_admin/customwidgets/customTextField.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({Key? key}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _createAccount(BuildContext context) async {
    try {
      // Validate email format
      if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
          .hasMatch(emailController.text)) {
        throw FirebaseAuthException(
          code: 'invalid-email',
          message: 'The email address is badly formatted.',
        );
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        // Send email verification
        await userCredential.user!.sendEmailVerification();

        // Add user details to Firestore collection
        await _firestore
            .collection('companies')
            .doc(userCredential.user!.uid)
            .set({
          'companyId': userCredential.user!.uid,
          'companyname': nameController.text,
          'email': emailController.text,
          'address': addressController.text,
      
          'phoneNo': phoneController.text,
          'userlogo':null
        });

        // Navigate to the next screen or perform any other action
        // ...

        print("Company registration successful");

        // Display success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Company registration successful. Verification email sent.'),
            duration: Duration(seconds: 3),
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      print("Error in registration: $e");

      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error in registration: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
    return Scaffold(
      backgroundColor: lightblue,
      body: Row(
        children: [
          _buildSideNavigation(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Company",
                            style: Theme.of(context).textTheme.headline5),
                        CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.png'))
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 60, left: 60),
                      child: CustomTextField(
                        hint: 'Company name',
                        controller: nameController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the company name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 60, left: 60),
                      child: CustomTextField(
                        hint: 'Company email',
                        controller: emailController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the company email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 60, left: 60),
                      child: CustomTextField(
                        hint: 'Phone number',
                        controller: phoneController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the phone number';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 60, left: 60),
                      child: CustomTextField(
                        hint: 'Company Id',
                        controller: idController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the company id';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 60, left: 60),
                      child: CustomTextField(
                        hint: 'Password',
                        controller: passwordController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the password';
                          }
                          return null;
                        },
                      ),
                    ),
                    
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 60, left: 60),
                      child: TextFormField(
                        controller: addressController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter the company address';
                          }
                          return null;
                        },
                        // obscureText: obscure,
                        // readOnly: readonly,
                        maxLines: 5,
                        decoration: InputDecoration(
                          errorBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          fillColor: white,
                          filled: true,
                          hintText: 'Address',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: white),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: white),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: InkWell(
                        onTap: (){
                          _createAccount(context);
                        },
                        child: Container(
                          height: 40,
                          color: Color.fromARGB(255, 8, 35, 170),
                          child: Center(
                            child: AppText(
                                text: 'Company Register',
                                weight: FontWeight.w500,
                                size: 20,
                                textcolor: white),
                          ),
                        ),
                      ),
                    ),

                    // Add other fields and a submit button here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideNavigation() {
    return  Container(
            width: 300,
            height: double.infinity,
            color: maincolor,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return Dashboard();
                    },));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.home,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AppText(
                          text: 'Home',
                          weight: FontWeight.w500,
                          size: 15,
                          textcolor: white),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                 onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return Users();
                    },));
                 },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.person,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AppText(
                          text: 'Users',
                          weight: FontWeight.w500,
                          size: 15,
                          textcolor: white),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                   onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return Company();
                    },));
                 },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.work,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AppText(
                          text: 'Company',
                          weight: FontWeight.w500,
                          size: 15,
                          textcolor: white),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return AddCompany();
                    },));
                 },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.work_history_outlined,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AppText(
                          text: 'Add Company',
                          weight: FontWeight.w500,
                          size: 15,
                          textcolor: white),
                    ],
                  ),
                ),
               
                
              
                SizedBox(
                  height: 30,
                ),
                InkWell(
                   onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return AdminLogin();
                    },));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.power_settings_new_rounded,
                        color: white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AppText(
                          text: 'Logout',
                          weight: FontWeight.w500,
                          size: 15,
                          textcolor: white),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Widget _buildNavItem(IconData icon, String text, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: white),
            SizedBox(width: 15),
            AppText(
                text: text,
                weight: FontWeight.w500,
                size: 15,
                textcolor: white),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
