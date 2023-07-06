import 'package:basicflutter/bloc/global_observer.dart';
import 'package:basicflutter/provider/auth_provider.dart';
import 'package:basicflutter/routes/routes.dart';
import 'package:basicflutter/styles/style.dart';
import 'package:basicflutter/views/auth_page.dart';
import 'package:basicflutter/views/index.dart';
import 'package:basicflutter/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/login_bloc.dart';
import 'bloc/switch_menu_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final navigatorState = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ignore: deprecated_member_use
  runApp(const Myapp());

  // BlocOverrides.runZoned(() {
  //   runApp(const Myapp());
  // }, blocObserver: GlobalObserver());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider(create: (context) => LoginBloc());
    final switchBloc = BlocProvider(create: (context) => SwitchMenuBloc());

    return MultiBlocProvider(
      providers: [loginBloc, switchBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter",
        theme: ThemeData(primaryColor: Styles.primaryColor),
        routes: AppRoutes.all,
        home: const AuthPage(),
        navigatorKey: navigatorState,
      ),
    );
  }
}
