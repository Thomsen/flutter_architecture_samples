
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_sample/todo.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class TodoComponent extends Component<Todo> {

  TodoComponent() : super(
      view: buildView
  );

}


Widget buildView(Todo todo, Dispatch dispatch, ViewService viewService) {

  return Container(
    key: ArchSampleKeys.todoItem(todo.id),
    child: Text(todo?.task),
  );

}