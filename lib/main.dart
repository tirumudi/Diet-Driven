import 'dart:async';

import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:diet_driven/repositories/repositories.dart';
import 'package:diet_driven/screens/home_screen.dart';
import 'package:diet_driven/screens/login.dart';
import 'package:diet_driven/screens/splash_screen.dart';
import 'package:diet_driven/screens/diary_page.dart';
import 'package:diet_driven/blocs/blocs.dart';


void main() {
  // Configure logger
  // const [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
  Logger.root.level = Level.INFO; //Level.FINE
  var format = new DateFormat("jms");
  Logger.root.onRecord.listen((LogRecord rec) {
    print("${rec.loggerName} ~ ${rec.level.name} ~ ${format.format(rec.time)} ~ ${rec.message}");
  });

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(
    userRepository: UserRepository(),
  ));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({@required this.userRepository});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  UserRepository get userRepository => widget.userRepository;

  AuthenticationBloc authenticationBloc;
  final ThemeBloc themeBloc = ThemeBloc();
  final FoodDiaryBloc foodDiaryBloc = FoodDiaryBloc(); // TODO: move this lower in hierarchy

  @override
  void initState() {
    super.initState();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthenticationBloc>(bloc: authenticationBloc),
        BlocProvider<ThemeBloc>(bloc: themeBloc),
        BlocProvider<FoodDiaryBloc>(bloc: foodDiaryBloc), // TODO: move this lower in hierarchy
      ],
      child: BlocBuilder(
        bloc: themeBloc,
        builder: (_, ThemeData theme) {
          return MaterialApp(
            title: "Diet Driven",
            home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthUninitialized) {
                  return SplashPage();
                }
                if (state is AuthAuthenticated) {
                  return HomePage();
                }
                if (state is AuthUnauthenticated) {
                  return LoginPage(userRepository: userRepository);
                }
                if (state is AuthLoading) {
                  return LoadingIndicator();
                }
              },
            ),
            theme: theme,
            initialRoute: "/", // TODO: replace with fluro?
//            routes: ,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    themeBloc.dispose();
    foodDiaryBloc.dispose();
    super.dispose();
  }
}

// TODO: make animation loader
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: CircularProgressIndicator(),
  );
}