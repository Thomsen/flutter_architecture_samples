
import 'package:fish_redux_sample/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class TodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(key: ArchSampleKeys.todosLoading);
  }

}
