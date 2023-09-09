// ignore_for_file: non_constant_identifier_names

import 'package:SneakerQuest/screens/authentication/signup_page.dart';
import 'package:flutter/material.dart';
import '../../Data/text_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisiblity = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
                    const Text(
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
                      SizedBox(height: size.height * .07),
                      Text(
                        'Login'.toUpperCase(),
                        style:const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.black,
                          letterSpacing: 5,
                        ),
                      ),
                      SizedBox(height: size.height * .05),
                      //-------------Login container----------------------//
                      Container(
                        height: size.height * .5,
                        margin: EdgeInsets.symmetric(
                          horizontal: size.height * .02,
                        ),
                        decoration: BoxDecoration(
                            color:const Color.fromARGB(139, 248, 248, 248),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.height * .02,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter valid email';
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
                                  focusColor: Colors.black,
                                ),
                              ),
                              SizedBox(height: size.height * .06),
                              TextFormField(
                                controller: passController,
                                obscureText: isVisiblity,
                                obscuringCharacter: '*',
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return 'Enter a valid Password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  label:const Text(
                                    'Password',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.grey,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      isVisiblity = !isVisiblity;
                                      setState(() {});
                                    },
                                    icon: isVisiblity
                                        ?const Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          )
                                        :const Icon(
                                            Icons.visibility,
                                            color: Colors.blue,
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * .01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      forgot_password_bottomSheet(
                                          context, size);
                                    },
                                    child: Text(
                                      'Forogt Password?',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.blue.shade600,
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
                                    if (_formKey.currentState!.validate()) {}
                                  },
                                  child:const Text(
                                    'Login',
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * .03),
                            const  Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>const SignupPage(),
                                      ));
                                },
                                child: Text(
                                  "signup",
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
                      SizedBox(height: size.height * .03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: size.height * .03),
                         const Icon(
                            Icons.apple,
                            size: 50,
                          ),
                          SizedBox(width: size.width * .02),
                        const  Icon(
                            Icons.facebook,
                            size: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(width: size.width * .02),
                          Image.network(
                            ImageConstants.googleIc,
                            height: 60,
                          ),
                        ],
                      )
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

//---------------------Forgot password 🔻-------------------------//
  void forgot_password_bottomSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.amber.shade200,
          height: size.height * .3,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .02,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * .01),
               const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              const  Divider(thickness: 2),
                TextFormField(
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
                SizedBox(height: size.height * .03),
                ElevatedButton(
                    onPressed: () {},
                    child:const Text(
                      'Sent OTP',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
