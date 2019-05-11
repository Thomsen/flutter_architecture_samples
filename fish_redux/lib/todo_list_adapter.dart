
import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux_sample/home_screen.dart';
import 'package:fish_redux_sample/todo_component.dart';

class TodoListAdapter extends DynamicFlowAdapter<ListTodo> {

  TodoListAdapter() :
      super(
          pool: <String, Component<Object>> {
            'toDo': TodoComponent(),
          },
          connector:_ListConnector(),
          reducer: _buildReducer()
      );

  static Reducer<ListTodo>_buildReducer() {
    return asReducer(<Object, Reducer<ListTodo>> {

    });
  }

}

class _ListConnector extends ConnOp<ListTodo, List<ItemBean>> {

  @override
  List<ItemBean> get(ListTodo state) {
    if (true == state?.todos?.isNotEmpty) {
      return state.todos.map((todo) => ItemBean("toDo", todo))
          .toList(growable: true);
    }
    return <ItemBean>[];
  }

}

