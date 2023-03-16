// redux_store.dart

import 'package:reduced/proxy.dart';
import 'package:reduced/reduced.dart';
import 'package:redux/redux.dart' as redux;

/// Extension on class [redux.Store] with support of the [Store] interface.
extension ReducedStoreOnStore on redux.Store {
  /// Create a StoreProxy for this [redux.Store]
  Store<S> proxy<S>() => StoreProxy(
        () => state,
        (event) => dispatch(event),
        this,
      );
}
