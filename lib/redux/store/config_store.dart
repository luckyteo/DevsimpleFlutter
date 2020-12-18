import 'package:devsimple_flutter/redux/models/app_state.dart';
import 'package:devsimple_flutter/redux/reducers/index.dart';
import 'package:devsimple_flutter/redux/sagas/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';

Store<AppState> configureStore() {
  SagaMiddleware sagaMiddleware = createSagaMiddleware();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      applyMiddleware(sagaMiddleware),
    ],
  );

  sagaMiddleware.setStore(store);

  sagaMiddleware.run(rootSaga);

  return store;
}
