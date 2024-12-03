import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../data/model/translation_details_model.dart';
import '../../data/model/translation_model.dart';

abstract class TranslationRepo {
  Future<Either<Failure, TranslationModel>> getTranslation(Map<String, String> params);
  Future<Either<Failure, TranslationDetailsModel>> getTranslationDetails(Map<String, String> params);
  Future<Either<Failure, void>> suggestWord(Map<String, dynamic> params);
}