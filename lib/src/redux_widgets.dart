// reduced_widgets.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart' as redux;
import 'package:reduced/reduced.dart';

import 'redux_store.dart';

class ReducedProvider<S> extends StatelessWidget {
  const ReducedProvider({
    super.key,
    required this.initialState,
    required this.child,
  });

  final S initialState;
  final Widget child;

  @override
  Widget build(BuildContext context) => StoreProvider(
      store: redux.Store<S>(
        (state, action) => action is Event ? action(state) : state,
        initialState: initialState,
      ),
      child: child);
}

class ReducedConsumer<S, P> extends StatelessWidget {
  const ReducedConsumer({
    super.key,
    required this.mapper,
    required this.builder,
  });

  final StateToPropsMapper<S, P> mapper;
  final WidgetFromPropsBuilder<P> builder;

  @override
  Widget build(BuildContext context) => StoreConnector<S, P>(
        distinct: true,
        converter: (store) => mapper(store.state, store.proxy<S>()),
        builder: (context, props) => builder(props: props),
      );
}
