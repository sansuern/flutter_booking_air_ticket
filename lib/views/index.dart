import 'package:basicflutter/bloc/switch_menu_bloc.dart';
import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/views/home.dart';
import 'package:basicflutter/views/profile.dart';
import 'package:basicflutter/views/search.dart';
import 'package:basicflutter/views/ticket.dart';
import 'package:basicflutter/widgets/ticket_tab.dart';
import 'package:basicflutter/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basicflutter/bloc/home_bloc.dart';

import '../main.dart';
import '../routes/routes.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Search(),
    const Ticket(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchMenuBloc, SwitchMenuState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    navigatorState.currentContext!,
                    AppRoutes.test,
                  );
                },
                child: Text("test")),
          ),
          backgroundColor: Styles.bgColor,
          body: Container(child: _widgetOptions[state.selectedIndex]),
          bottomNavigationBar: BottomBar(state.selectedIndex),
        );
      },
    );
  }
}
