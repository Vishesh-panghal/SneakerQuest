


import 'package:flutter/material.dart';

import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isVisiblity = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .7,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius:const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset:const Offset(10, 11),
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 50,
                  )
                ]),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.height * .05),
                    const  Text(
                        'Sneaker Quest',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 7,
                          wordSpacing: 3,
                        ),
                      ),
                      SizedBox(height: size.height * .05),
                      Text(
                        'Signup'.toUpperCase(),
                        style:const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.black,
                          letterSpacing: 5,
                        ),
                      ),
                      SizedBox(height: size.height * .03),
                      //-------------Login container----------------------//
                      Container(
                        height: size.height * .8,
                        margin: EdgeInsets.symmetric(
                          horizontal: size.height * .02,
                        ),
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(139, 248, 248, 248),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.height * .02,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * .04),
                              Row(
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    controller: firstNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid\n First name';
                                      }
                                      return null;
                                    },
                                    decoration:const InputDecoration(
                                        label: Text(
                                      'First name',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.grey,
                                      ),
                                    )),
                                  )),
                                  SizedBox(width: size.height * .01),
                                  Expanded(
                                      child: TextFormField(
                                    controller: lastNameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a valid\n Last name';
                                      }
                                      return null;
                                    },
                                    decoration:const InputDecoration(
                                        label: Text(
                                      'Last name',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.grey,
                                      ),
                                    )),
                                  )),
                                ],
                              ),
                              SizedBox(height: size.height * .04),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration:const InputDecoration(
                                  label: Text(
                                    'Email',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * .04),
                              TextFormField(
                                controller: phnController,
                                validator: (value) {
                                  if (value!.length != 10) {
                                    return 'Please enter valid phone number!';
                                  }
                                  return null;
                                },
                                decoration:const InputDecoration(
                                  label: Text(
                                    'Phone',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * .04),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: passController,
                                      obscureText: isVisiblity,
                                      obscuringCharacter: '*',
                                      validator: (value) {
                                        if (value!.length < 6) {
                                          return 'Please entre an password\n more than 6';
                                        }
                                        return null;
                                      },
                                      decoration:const InputDecoration(
                                        label: Text(
                                          'Password',
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.height * .01),
                                  Expanded(
                                    child: TextFormField(
                                      controller: confirmPassController,
                                      obscureText: isVisiblity,
                                      obscuringCharacter: '*',
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Confirm password can not\n be empty';
                                        } else if (value !=
                                            passController.text.toString()) {
                                          return 'Confirm password and password is not same!';
                                        }
                                        return null;
                                      },
                                      decoration:const InputDecoration(
                                        label: Text(
                                          'Confirm Password',
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * .06),
                              SizedBox(
                                width: size.width * .7,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginPage(),
                                          ));
                                      firstNameController.clear();
                                      lastNameController.clear();
                                      emailController.clear();
                                      phnController.clear();
                                      passController.clear();
                                      confirmPassController.clear();
                                    }
                                  },
                                  child:const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * .03),
                             const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
