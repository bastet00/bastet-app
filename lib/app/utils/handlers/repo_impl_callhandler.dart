import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../error/exceptions.dart';
import '../../error/failures.dart';
import '../../network/network_info.dart';

class RepoImplCallHandler<T> {
  final NetworkInfo networkInfo;
  RepoImplCallHandler(this.networkInfo);

  Future<Either<Failure, T>> call(Future<T> Function() datasourceCall) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await datasourceCall());
      } on DataParsingException catch(e) {
        log(e.toString(), name: 'Data Parsing Exception Error');
        return Left(DataParsingFailure(e.toString()));
      } on ServerException catch (e) {
        log(e.toString(), name: 'Server Exception Error');
        return Left(ServerFailure(e.toString()));
      } on SocketException catch (e) {
        log(e.toString(), name: 'Socket Exception Error');
        return Left(
          ConnectionFailure('تعذر الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت أو المحاولة مرة أخرى لاحقًا.'),
        );
      } catch (e) {
        log(e.toString(), name: 'Unknown Error');
        return Left(AmbiguousFailure('خطأ غير متوقع، رجاء محاولة مرة أخرى'));
      }
    } else {
      return Left(ConnectionFailure("أنت غير متصل بالإنترنت!"));
    }
  }
}
