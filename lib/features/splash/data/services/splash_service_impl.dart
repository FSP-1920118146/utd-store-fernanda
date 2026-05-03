import '../../domain/services/splash_service.dart';

class SplashServiceImpl implements SplashService {

  final int nimLastDigit;

  SplashServiceImpl(this.nimLastDigit);

  @override
  Future<void> wait() async {

    final delay =
        nimLastDigit == 0 ? 5 : nimLastDigit;

    await Future.delayed(
      Duration(seconds: delay),
    );
  }
}