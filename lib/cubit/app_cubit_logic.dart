import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/screens/detail_page.dart';
import 'package:flutter_cubit/screens/home_screen.dart';
import 'package:flutter_cubit/screens/navscreens/main_screen.dart';
import 'package:flutter_cubit/screens/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomeScreen();
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return const MainScreen();
        } else if (state is DetailState) {
          return const DetailScreen();
        } else {
          return Container();
        }
      }),
    );
  }
}
