### Definition:

#### A Bloc is a special type of Cubit which transforms incoming events into outgoing states.

Note: All widgets exported by the flutter_bloc package integrate with both Cubit and Bloc instances.

---

#### 1 BlocBuilder

needs a `Bloc` and a `builder`. handels the building of the widget in response to new state.

```dart
BlocBuilder<BlocA, BlocAState>(
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```

A little lost here

```dart
BlocBuilder<BlocA, BlocAState>(
  cubit: blocA, // provide the local cubit instance
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```

`buildWhen` is a conditional that will cause the builder to invoke

```dart
BlocBuilder<BlocA, BlocAState>(
  buildWhen: (previousState, state) {
    // return true/false to determine whether or not
    // to rebuild the widget with state
  },
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```

#### 2 BlocProvider

It is used as a dependency injection (DI) widget so that a single instance of a bloc can be provided to multiple widgets within a subtree.

```dart
BlocProvider(
  create: (BuildContext context) => BlocA(),
  child: ChildA(),
);
```

Retreve BlocA

```dart
BlocProvider.value(
  value: BlocProvider.of<BlocA>(context),
  child: ScreenA(),
);

// with extensions
context.bloc<BlocA>();

// without extensions
BlocProvider.of<BlocA>(context)
```

#### 3 MultiBloc Provider

MultiBlocProvider is a Flutter widget that merges multiple BlocProvider widgets into one. MultiBlocProvider improves the readability and eliminates the need to nest multiple BlocProviders. By using MultiBlocProvider

before

```dart
BlocProvider<BlocA>(
  create: (BuildContext context) => BlocA(),
  child: BlocProvider<BlocB>(
    create: (BuildContext context) => BlocB(),
    child: BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
      child: ChildA(),
    )
  )
)
```

after

```dart
MultiBlocProvider(
  providers: [
    BlocProvider<BlocA>(
      create: (BuildContext context) => BlocA(),
    ),
    BlocProvider<BlocB>(
      create: (BuildContext context) => BlocB(),
    ),
    BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
    ),
  ],
  child: ChildA(),
)
```

#### 4 BlocListener

BlocListener is a Flutter widget which takes a BlocWidgetListener and an optional Bloc and invokes the listener in response to state changes in the bloc. It should be used for functionality that needs to occur once per state change such as navigation, showing a SnackBar, showing a Dialog, etc..

listener is only called once for each state change (NOT including the initial state) unlike builder in BlocBuilder and is a void function.

```dart
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {
    // do stuff here based on BlocA's state
  },
  child: Container(),
)
```

use `listenWhen` to invoke the listener

```dart
BlocListener<BlocA, BlocAState>(
  listenWhen: (previousState, state) {
    // return true/false to determine whether or not
    // to call listener with state
  },
  listener: (context, state) {
    // do stuff here based on BlocA's state
  },
  child: Container(),
)
```

#### 5 MultiBlocListener

MultiBlocListener is a Flutter widget that merges multiple BlocListener widgets into one. MultiBlocListener improves the readability and eliminates the need to nest multiple BlocListeners. By using MultiBlocListener

from

```dart
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {},
  child: BlocListener<BlocB, BlocBState>(
    listener: (context, state) {},
    child: BlocListener<BlocC, BlocCState>(
      listener: (context, state) {},
      child: ChildA(),
    ),
  ),
)
```

to

```dart
MultiBlocListener(
  listeners: [
    BlocListener<BlocA, BlocAState>(
      listener: (context, state) {},
    ),
    BlocListener<BlocB, BlocBState>(
      listener: (context, state) {},
    ),
    BlocListener<BlocC, BlocCState>(
      listener: (context, state) {},
    ),
  ],
  child: ChildA(),
)
```

#### 6 BlocConsumer
