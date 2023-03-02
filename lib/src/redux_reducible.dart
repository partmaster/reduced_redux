// redux_reducible.dart

import 'package:reduced/reduced.dart';
import 'package:redux/redux.dart' hide Reducer;

/// Extension on class [Store] with support of the [Reducible] interface.
extension ReducibleStore on Store {
  /// Create a ReducibleProxy for this [Store]
  Reducible<S> reducible<S>() => ReducibleProxy(
        () => state,
        (reducer) => dispatch(reducer),
        this,
      );
}
