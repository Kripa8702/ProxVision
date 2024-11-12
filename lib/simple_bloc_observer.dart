import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proxvision/utils/colored_logs.dart';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    ColoredLogs.error(error.toString());
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    ColoredLogs.info(change.toString());
    super.onChange(bloc, change);
  }
}
