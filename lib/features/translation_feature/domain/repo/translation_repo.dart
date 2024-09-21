import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../data/model/translation_model.dart';

abstract class TranslationRepo {
  Future<Either<Failure, TranslationModel>> getTranslation(Map<String, String> map);
}