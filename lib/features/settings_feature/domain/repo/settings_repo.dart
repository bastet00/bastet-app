import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String>> getPrivacyPolicy();
}