import 'package:devsimple_flutter/redux/actions/actions_movie.dart';
import 'package:redux_saga/redux_saga.dart';

watchSagaMovie() sync* {
  yield TakeLatest(_getMovies, pattern: ActionGetMovie);
}

_getMovies({action}) sync* {
  print('run get movie $action');

}
