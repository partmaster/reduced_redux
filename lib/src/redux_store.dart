
// redux_store.dart

import 'package:reduced/reduced.dart';
import 'package:redux/redux.dart' hide Reducer;

/// Extension on class [Store] with support of the [Reducible] interface.
extension ReducedStoreOnStore on Store {
  /// Create a ReducibleProxy for this [Store]
  ReducedStore<S> proxy<S>() => ReducedStoreProxy(
        () => state,
        (reducer) => dispatch(reducer),
        this,
      );
}
