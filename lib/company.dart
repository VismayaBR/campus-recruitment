import 'package:campus_recruitment_admin/AddCompany.dart';
import 'package:campus_recruitment_admin/AdminLogin.dart';
import 'package:campus_recruitment_admin/Dashboard.dart';
import 'package:campus_recruitment_admin/Users.dart';
import 'package:campus_recruitment_admin/colors/colors.dart';
import 'package:campus_recruitment_admin/customwidgets/appText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Company extends StatefulWidget {
  const Company({super.key});

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationBar(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('companies').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                var users = snapshot.data?.docs ?? [];
                if (users.isEmpty) {
                  return const Center(child: Text('No users found!'));
                }

                return ResponsiveGridList(
                  desiredItemWidth: 400,
                  minSpacing: 10,
                  children: users.map((user) {
                    var userData = user.data() as Map<String, dynamic>;
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage: AssetImage('assets/images/bg.png'),),
                        title: Text(userData['companyname'] ?? 'N/A'),
                        subtitle: Text(userData['email'] ?? 'No email provided'),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

  Widget _buildNavItem(BuildContext context, IconData icon, String text, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 15),
            AppText(text: text, weight: FontWeight.w500, size: 15, textcolor: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 15),
          AppText(text: text, weight: FontWeight.w500, size: 15, textcolor: Colors.white),
        ],
      ),
    );
  }
}