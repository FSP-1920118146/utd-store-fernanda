abstract class IsolateState {}


class IsolateInitial
    extends IsolateState {}


class IsolateLoading
    extends IsolateState {}


class IsolateLoaded
    extends IsolateState {

  final String result;

  IsolateLoaded(
    this.result,
  );
}


class IsolateError
    extends IsolateState {

  final String message;

  IsolateError(
    this.message,
  );
}