### Definition:

#### A Cubit is special type of Stream which is used as the base for the Bloc class.A cubit seems to be able to manage state and allow observation of state.

---

### 1 Create Cubit

```dart
class CounterCubit extends Cubit<int> { // int is the state, you can use a no primative type
  CounterCubit(int initialState) : super(initialState); // constructor
}
```

### 2 Invoke a state change

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1); // medthod created that has access to the state attribute(getter) from the class emit is a protected method that returns and adjusted state
}

void main() {
  final cubit = CounterCubit();
  print(cubit.state); // 0
  cubit.increment();
  print(cubit.state); // 1
  cubit.close(); // close the internal state stream
}
```

### 3 Subscribe to a cubit

```dart
Future<void> main() async {
  final cubit = CounterCubit(); // init the cubit
  final subscription = cubit.listen(print); // print funtion that get passed state implicitly, print is passed - returns 1
  cubit.increment(); // add 1
  await Future.delayed(Duration.zero); // adds delay so that the stream does not close before the subscription can print out the result
  await subscription.cancel(); // close the subscription to stop updates
  await cubit.close(); // close internal state stream
}
```

### 4 Observing a cubit

#### 4.1 Change

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    print(change); // Change print gives you current state and new state
    super.onChange(change); // this invokes the change on you are done observing
  }
}
```

#### 4.2 BlocObserver

```dart
// Bloc Observer can observ all cubits, gets executed after internal obervations in cubit
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  CounterCubit()
    ..increment()
    ..close();
}
```

The output would be

```
Change { currentState: 0, nextState: 1 }
CounterCubit Change { currentState: 0, nextState: 1 }
```

### 5 Error Handeling

Called when a error has occurred

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    addError(Exception('increment error!'), StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
```

Same can be done with a `BlocObserver`

```dart
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}
```
