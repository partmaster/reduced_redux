import 'package:flutter_test/flutter_test.dart';
import 'package:reduced/reduced.dart';

import 'package:reduced_redux/reduced_redux.dart';
import 'package:redux/redux.dart' as redux;

class CounterIncremented extends Event<int> {
  @override
  int call(int state) => state + 1;
}

void main() {
  test('Store state 0', () {
    final objectUnderTest = redux.Store(
      (state, action) => action is Event ? action(state) : state,
      initialState: 0,
    );
    expect(objectUnderTest.state, 0);
  });

  test('Store state 1', () {
    final objectUnderTest = redux.Store(
      (state, action) => action is Event ? action(state) : state,
      initialState: 1,
    );
    expect(objectUnderTest.state, 1);
  });

  test('Store.proxy() process', () async {
    final objectUnderTest = redux.Store(
      (state, action) => action is Event ? action(state) : state,
      initialState: 0,
    ).proxy();
    objectUnderTest.process(CounterIncremented());
    expect(objectUnderTest.state, 1);
  });
}
