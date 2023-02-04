import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/failure.dart';

typedef FututeEither<T> = Future<Either<Failure, T>>;
typedef FututeEitherVoid = FututeEither<void>;
typedef FutureVoid = Future<void>;
