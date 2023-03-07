import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reduced/reduced.dart';

import 'package:reduced_redux/reduced_redux.dart';
import 'package:redux/redux.dart' hide Reducer;

class Incrementer extends Reducer<int> {
  @override
  int call(int state) {
    return state + 1;
  }
}

void main() {
  test('Store state 0', () {
    final objectUnderTest = Store(
      (state, action) => action is Reducer ? action(state) : state,
      initialState: 0,
    );
    expect(objectUnderTest.state, 0);
  });

  test('Store state 1', () {
    final objectUnderTest = Store(
      (state, action) => action is Reducer ? action(state) : state,
      initialState: 1,
    );
    expect(objectUnderTest.state, 1);
  });

  test('Store.proxy() reduce', () async {
    final objectUnderTest = Store(
      (state, action) => action is Reducer ? action(state) : state,
      initialState: 0,
    ).proxy();
    objectUnderTest.reduce(Incrementer());
    expect(objectUnderTest.state, 1);
  });
}
