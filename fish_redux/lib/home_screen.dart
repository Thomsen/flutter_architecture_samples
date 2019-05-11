
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_sample/loading_indicator.dart';
import 'package:fish_redux_sample/localization.dart';
import 'package:fish_redux_sample/todo.dart';
import 'package:fish_redux_sample/todo_list.dart';
import 'package:fish_redux_sample/todo_list_adapter.dart';
import 'package:flutter/material.dart';

import 'package:todos_app_core/todos_app_core.dart';

class HomeScreen extends Page<ListTodo, Map<String, dynamic>> {

  HomeScreen() : super(
    initState: initTodo,
    effect: loadEffect(),
    reducer: buildReducer(),
    view: buildView,
    dependencies: Dependencies<ListTodo> (
        adapter: TodoListAdapter(),
    )
  );

}

ListTodo initTodo(Map<String, dynamic> args) {
  return ListTodo();
}

class ListTodo implements Cloneable<ListTodo> {

  bool isLoading = true;

  List<Todo> todos;

  @override
  ListTodo clone() {
    return ListTodo()
      ..isLoading = isLoading
      ..todos = todos;
  }

}


Effect<ListTodo> loadEffect() {
  return combineEffects(<Object, Effect<ListTodo>> {
    Lifecycle.initState: _init,
    PageAction.fetchTodos: _fetch,
  });
}

void _fetch(Action action, Context<ListTodo> ctx) {
  final List<Todo> todos = <Todo>[
    Todo('Hello world',
      note: 'Learn how to program.',
      id: "1",
      complete: true,
    ),
    Todo('Hello world',
      note: 'Learn how to program.',
      id: "2",
      complete: true,
    ),
    Todo('Hello world',
      note: 'Learn how to program.',
      id: "3",
      complete: true,
    ),
    Todo('Hello world',
      note: 'Learn how to program.',
      id: "4",
      complete: true,
    ),
    Todo('Hello world',
      note: 'Learn how to program.',
      id: "5",
      complete: true,
    ),
  ];

  Future.delayed(Duration(seconds: 3), () {
    ctx.dispatch(PageActionCreator.onFetchSuccessAction(todos));
  });

}

void _init(Action action, Context<ListTodo> ctx) {

//  ctx.dispatch(PageActionCreator.initTodosAction(initToDos));

  ctx.dispatch(PageActionCreator.fetchTodosAction());

}


Reducer<ListTodo> buildReducer() {
  return asReducer(<Object, Reducer<ListTodo>> {
    PageAction.initTodos: _initTodosReducer,
    PageAction.onFetchSucess: _initTodosReducer,
  });
}

ListTodo _initTodosReducer(ListTodo listTodo, Action action) {
  final List<Todo> todos = action.payload ?? <Todo>[];
  final ListTodo lt = listTodo.clone();
  if (todos.length > 0) {
    lt.isLoading = false;
  }
  lt.todos = todos;
  return lt;
}

Widget buildView(ListTodo listTodo, Dispatch dispatch, ViewService viewService) {

  final ListAdapter adapter = viewService.buildAdapter();

  return Scaffold(
      appBar: AppBar(
        title: Text(FishLocalizations().appTitle),
      ),
      body: listTodo.isLoading ? LoadingIndicator(key: ArchSampleKeys.todosLoading)
          : Container(
          child: Column(
            children: <Widget>[
//              viewService.buildComponent('report'),
              Expanded(
                child: ListView.builder(
                  key: ArchSampleKeys.todoList,
                  itemBuilder: adapter.itemBuilder,
                  itemCount:  adapter.itemCount,),
              )
            ],
          ))
  );

}


enum PageAction { initTodos, fetchTodos, onFetchSucess, onAdd, }

class PageActionCreator {
  static Action initTodosAction(List<Todo> todos) {
    return Action(PageAction.initTodos, payload: todos);
  }

  static Action fetchTodosAction() {
    return Action(PageAction.fetchTodos);
  }

  static Action onFetchSuccessAction(List<Todo> todos) {
    return Action(PageAction.onFetchSucess, payload: todos);
  }

  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }
}






