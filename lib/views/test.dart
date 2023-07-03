import 'package:basicflutter/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  HomeBloc homebloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    homebloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: HomeBloc(),
      listener: (context, state) {},
      builder: (context, state) {
        print("state: ${state.runtimeType}");
        return Scaffold(
          body: Text("Test Page"),
        );
      },
    );
  }
}
