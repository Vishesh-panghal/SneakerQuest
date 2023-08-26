// ignore_for_file: use_build_context_synchronously, unused_local_variable, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nike_store/Data/app_database.dart';
import 'package:nike_store/Data/app_model.dart';

import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var arrUsr = [];
  late AppDatabase myDB;

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    myDB = AppDatabase.db;
    getUser();
    super.initState();
  }

  void getUser() async {
    // arrUsr = await myDB.fetchUsr();
  }

  void addusr(UsrModel usr) async {
    bool check = await myDB.addusr(usr);
    if (check) {
      var userList = await myDB.fetchUsr();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 246, 212, 101),
            Color.fromARGB(96, 237, 216, 139),
          ],
          begin: Alignment.topLeft,
        )),
        child: SafeArea(
          bottom: false,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              const  SizedBox(height: 30),
              const  Text(
                  'SneakerQuest',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const  SizedBox(height: 50),
                //------------TextForm Field-------------------------//
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:const [
                        BoxShadow(
                          blurRadius: 12,
                          offset: Offset(-1, 0),
                        )
                      ]),
                  height: 600,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //--------------Signup Text-------------------//
                      const  Text(
                          'Signup',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const  Divider(),
                      const  SizedBox(height: 20),
                        //-----------Input Field--------------------//
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email can't be Empty";
                            }
                            return null;
                          },
                          decoration:const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      const  SizedBox(height: 15),
                        TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value!.length != 10) {
                              return "Please provide correct phone number";
                            }
                            return null;
                          },
                          decoration:const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            hintText: 'Phone',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      const  SizedBox(height: 15),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.length < 6) {
                              return "Password can't be less than 6";
                            }
                            return null;
                          },
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration:const InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      const  SizedBox(height: 15),
                        TextFormField(
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return "Confirm password and password is not same!";
                            }
                            return null;
                          },
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration:const InputDecoration(
                            prefixIcon: Icon(
                              Icons.password_outlined,
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                       const SizedBox(height: 20),
                      const  Divider(),
                        //------------------Register Btn---------------//
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade400,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (await myDB
                                  .findUser(emailController.text.toString())) {
                                var email = emailController.text.toString();
                                var phone = phoneController.text.toString();
                                var password =
                                    passwordController.text.toString();

                                addusr(
                                  UsrModel(
                                      email: email,
                                      phone: phone,
                                      password: password),
                                );
                                emailController.clear();
                                phoneController.clear();
                                passwordController.clear();
                                confirmPasswordController.clear();
                                Timer(const Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ));
                              }
                            }
                          },
                          child:const Text(
                            'Register',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        //----------------Login-----------------------//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           const Text('Already have an account?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
                                child:const Text('Login'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
               const SizedBox(height: 30),
               const Text(
                  '   Made with ❤️\nVishesh Panghal',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
