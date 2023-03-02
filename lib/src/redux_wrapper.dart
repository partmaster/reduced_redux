// reduced_wrapper.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart' hide Reducer;
import 'package:reduced/reduced.dart';

import 'redux_reducible.dart';

Widget wrapWithProvider<S>({
  required S initialState,
  required Widget child,
}) =>
    StoreProvider(
        store: Store(
          (state, action) =>
              action is Reducer ? action(state) : state,
          initialState: initialState,
        ),
        child: child);

Widget wrapWithConsumer<S, P>({
  required ReducedTransformer<S, P> transformer,
  required ReducedWidgetBuilder<P> builder,
}) =>
    StoreConnector<S, P>(
      distinct: true,
      converter: (store) => transformer(store.reducible<S>()),
      builder: (context, props) => builder(props: props),
    );
