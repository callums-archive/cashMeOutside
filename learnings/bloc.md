### Definition:

#### A Bloc is a special type of Cubit which transforms incoming events into outgoing states.

#### Creating a Bloc is similar to creating a Cubit except in addition to defining the state that we'll be managing, we must also define the event that the Bloc will be able to process.

---

### 1 Init

#### Events: Events are the input to a Bloc. They are commonly added in response to user interactions such as button presses or lifecycle events like page loads.

```dart
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() super(0);
}
```

### 2 State changes

`mapEventToState` is used to take in events and outputing one or more states

`async*` is a async generator - stated are emmited through `yield`

```dart
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0); // constructor

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}
```

```
Blocs should never directly emit new states. Instead every state change must be output in response to an incoming event within mapEventToState.
```

```
Both blocs and cubits will ignore duplicate states. If we yield or emit State nextState where state == nextState, then no state change will occur.
```

### 3 Using a Bloc

```dart
Future<void> main() async {
  final bloc = CounterBloc(); // init
  print(bloc.state); // 0
  bloc.add(CounterEvent.increment); // bloc.add is used to invoke an event
  await Future.delayed(Duration.zero); // delay to stop
  print(bloc.state); // 1
  await bloc.close(); // close up the bloc internal state stream
}
```

```
Note: await Future.delayed(Duration.zero) is added to ensure we wait for the next event-loop iteration (allowing mapEventToState to process the increment event).
```

### 3.1 Stream usage in a Bloc

Real time state update from Bloc stream

```dart
Future<void> main() async {
  final bloc = CounterBloc(); //init
  final subscription = bloc.listen(print); // 1
  bloc.add(CounterEvent.increment); // increment
  await Future.delayed(Duration.zero); // delay to get no exit subscription
  await subscription.cancel(); // stop the subscription, no more updates
  await bloc.close(); // close out the internal state
}
```

### 4 Observing a bloc

```dart
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

void main() {
  CounterBloc()
    ..add(CounterEvent.increment)
    ..close();
}
```

#### onTransition

```dart
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override // onTransition is invoked before onChance it also contains the same data along with the event
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
```

OP:

```
Transition { currentState: 0, event: CounterEvent.increment, nextState: 1 }
Change { currentState: 0, nextState: 1 }
```

#### Observe all Transitions

```dart
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  CounterBloc()
    ..add(CounterEvent.increment)
    ..close();
}
```

```
Transition { currentState: 0, event: CounterEvent.increment, nextState: 1 }
CounterBloc Transition { currentState: 0, event: CounterEvent.increment, nextState: 1 }
Change { currentState: 0, nextState: 1 }
CounterBloc Change { currentState: 0, nextState: 1 }
```

Note: onTransition is invoked first (local before global) followed by onChange.

#### onEvent

Called when event is added

```dart
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }

  @override
  void onEvent(CounterEvent event) {
    print(event);
    super.onEvent(event);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
```

#### On BlocObserver

```dart
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
```

```
CounterEvent.increment
CounterBloc CounterEvent.increment
```

### 5 Error Handeling

`onError` - react to all errors
`addError` - Indicate that an error has occurred

```dart
enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        addError(Exception('increment error!'), StackTrace.current);
        yield state + 1;
        break;
    }
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
```

Local `onError` will be called first, the the `BlocObserver`

Note: `onError` and `onChange` work the exact same way for both Bloc and Cubit instances.

Any unhandled exceptions that occur within mapEventToState are also reported to onError.

### Cubit vs. Bloc

`Cubit`'s are easier to implement, all you have to worry about is the state and function that you create to manipulate the state

`Bloc`'s require events, events are ingressed by the mapEventToState however, the code looks cleaner, a big advatage is `traceability`
[more here](https://bloclibrary.dev/#/coreconcepts?id=bloc-advantages)
