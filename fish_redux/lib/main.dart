
import 'package:fish_redux_sample/todo_list.dart';
import 'package:flutter/material.dart';

import 'package:fish_redux/fish_redux.dart';

import 'package:fish_redux_sample/localization.dart';

import 'package:todos_app_core/todos_app_core.dart';

import 'home_screen.dart';

void main() {
  runApp(FishReduxApp());
}

class FishReduxApp extends StatelessWidget {

  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes> [
    PageRoutes(
      pages: <String, Page<Object, dynamic>> {
        ArchSampleRoutes.home:  HomeScreen(),
      }
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FishLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FishLocalizationsDelegate(),
      ],
      home: routes.buildPage(ArchSampleRoutes.home, null),
    );
  }

}