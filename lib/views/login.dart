import 'package:basicflutter/bloc/home_bloc.dart';
import 'package:basicflutter/models/auth.dart';
import 'package:basicflutter/models/user.dart';
import 'package:basicflutter/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
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
        width: 500,
        height: 500,
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
                          const Text(
                            // ignore: unnecessary_brace_in_string_interps
                            "เข้าสู่ระบบ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
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
                            child: Text("เข้าสู่ระบบ"),
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
        controller: _usernameController,
        validator: RequiredValidator(errorText: "กรุณากรอกรหัสสมาชิก"),
        autofocus: false,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
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

  void _handleClickLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (formKey.currentState!.validate()) {
      final user = User(
          username: _usernameController.text,
          password: _passwordController.text);
      context.read<LoginBloc>().add(LoginEventSignin(user));
      // formKey.currentState?.reset();
    }
  }
}
