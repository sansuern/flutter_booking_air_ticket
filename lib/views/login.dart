import 'package:basicflutter/bloc/home_bloc.dart';
import 'package:basicflutter/models/auth.dart';
import 'package:basicflutter/models/user.dart';
import 'package:basicflutter/routes/routes.dart';
import 'package:basicflutter/services/auth.dart';
import 'package:basicflutter/utils/layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Form());
  }

  _Form() {
    return Center(
      child: Container(
        width: AppLayout.getWidth(500),
        height: AppLayout.getHeight(600),
        decoration: const BoxDecoration(
          // ignore: prefer_const_constructors
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
          child: Center(
            child: Form(
                key: formKey,
                child: Column(children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          Icon(Icons.lock, size: AppLayout.getHeight(70)),
                          Gap(AppLayout.getHeight(30)),
                          Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "Signin with Email and Password",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: AppLayout.getHeight(20),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          ..._MuitipleInput(),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _handleClickLogin,
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(500, 50),
                                backgroundColor:
                                    Color.fromRGBO(94, 114, 228, 1)),
                            child: Text("Sign In"),
                          ),
                          const SizedBox(height: 20),
                          const Text("or continue with"),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => AuthService().signinWithGoogle(),
                            style: TextButton.styleFrom(
                                minimumSize: const Size(500, 50),
                                backgroundColor:
                                    Color.fromRGBO(94, 114, 228, 1)),
                            child: Text("Google"),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _handleClickLogin,
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(500, 50),
                                backgroundColor:
                                    Color.fromRGBO(94, 114, 228, 1)),
                            child: Text("Facebook"),
                          ),
                        ],
                      );
                    },
                  ),
                ])),
          ),
        ),
      ),
    );
  }

  _MuitipleInput() {
    return [
      const SizedBox(height: 30),
      TextFormField(
        controller: _emailController,
        validator: RequiredValidator(errorText: "กรุณากรอกรหัสสมาชิก"),
        autofocus: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
      const SizedBox(height: 16),
      TextFormField(
        controller: _passwordController,
        validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
      const SizedBox(height: 20),
    ];
  }

  void _handleClickLogin() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (error) {
        if (error.code == "wrong-password") {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Wrong password"),
              );
            },
          );
        } else if (error.code == "user-not-found") {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("User not found: $email"),
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Invalid Email: $email"),
              );
            },
          );
        }
      }

      // final user = User(
      //     username: _emailController.text,
      //     password: _passwordController.text);
      // context.read<LoginBloc>().add(LoginEventSignin(user));
      // formKey.currentState?.reset();
    }
  }
}
