// redux_store.dart

import 'package:reduced/reduced.dart' as reduced;
import 'package:redux/redux.dart' as redux;

/// Extension on class [redux.Store] with support of the [reduce.Store] interface.
extension ReducedStoreOnStore on redux.Store {
  /// Create a StoreProxy for this [redux.Store]
  reduced.Store<S> proxy<S>() => reduced.StoreProxy(
        () => state,
        (event) => dispatch(event),
        this,
      );
}
