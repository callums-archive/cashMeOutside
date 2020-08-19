```
add test: ^1.3.0 and bloc_test: ^7.0.0 to pubspec.yml
```

```dart
group('CounterBloc', () {
    CounterBloc counterBloc;

    setUp(() {
        counterBloc = CounterBloc();
    });

    test('initial state is 0', () {
        expect(counterBloc.state, 0);
    });

    blocTest(
        'emits [1] when CounterEvent.increment is added',
        build: () => counterBloc,
        act: (bloc) => bloc.add(CounterEvent.increment),
        expect: [1],
    );

    blocTest(
        'emits [-1] when CounterEvent.decrement is added',
        build: () => counterBloc,
        act: (bloc) => bloc.add(CounterEvent.decrement),
        expect: [-1],
    );
});
```

Note: We can run all of our tests with the `pub run test` command.
