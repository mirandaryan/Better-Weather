import 'package:flutter/material.dart';
import 'package:better_weather/pages/log_in.dart';
import 'package:better_weather/pages/sign_up.dart';
import 'package:better_weather/pages/home.dart';
import 'package:better_weather/pages/change_location.dart';
import 'package:better_weather/pages/add_widget.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/sign_up': (context) => const SignUp(),
      '/': (context) => const MyHomePage(),
      '/location': (context) => const ChangeLocation(),
      '/add_widget': (context) => const AddWidget(),
    }
));



