import 'package:campus_recruitment_admin/AddCompany.dart';
import 'package:campus_recruitment_admin/AdminLogin.dart';
import 'package:campus_recruitment_admin/Users.dart';
import 'package:campus_recruitment_admin/colors/colors.dart';
import 'package:campus_recruitment_admin/company.dart';
import 'package:campus_recruitment_admin/customwidgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
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
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text('ADMIN'),
                SizedBox(width: 15,),
                  CircleAvatar(backgroundImage: AssetImage('assets/images/pro.png'),)
                   ],
               ),
              Row(
                children: [
                 
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: const EdgeInsets.all(
                        10), // Adds margin around the container
                    child: Image.asset('assets/images/hd.png',
                        fit: BoxFit.contain),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
