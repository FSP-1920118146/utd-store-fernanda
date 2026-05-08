import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'isolate_state.dart';


class IsolateCubit
    extends Cubit<IsolateState> {

  IsolateCubit()
      : super(
          IsolateInitial(),
        );


  Future<void>
      testIsolate() async {

    try {

      emit(
        IsolateLoading(),
      );


      final result =
          await compute(
        heavyTask,
        500000000,
      );


      emit(
        IsolateLoaded(
          result,
        ),
      );

    } catch (e) {

      emit(
        IsolateError(
          e.toString(),
        ),
      );
    }
  }
}


String heavyTask(
  int total,
) {

  int sum = 0;

  for (
    int i = 0;
    i < total;
    i++
  ) {

    sum += i;
  }

  return
      'Done: $sum';
}