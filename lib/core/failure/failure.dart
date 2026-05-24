import 'package:firebase_core/firebase_core.dart' show FirebaseException;

abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;

  factory Failure.handle(dynamic error) {
    // Firebase Errors
    if (error is FirebaseException) {
      switch (error.code) {
        case 'network-request-failed':
        case 'unavailable':
          return const RequestFailure('No internet connection');

        case 'cancelled':
          return const RequestFailure('Request cancelled');

        case 'deadline-exceeded':
          return const RequestFailure('Request timeout');

        case 'permission-denied':
          return RequestFailure(error.message ?? 'Permission denied');

        case 'unauthenticated':
          return RequestFailure(error.message ?? 'Unauthenticated');

        case 'not-found':
          return RequestFailure(error.message ?? 'Resource not found');

        case 'already-exists':
          return RequestFailure(error.message ?? 'Resource already exists');

        default:
          return RequestFailure(error.message ?? error.toString());
      }
    }
    // Other Errors
    return RequestFailure(error.toString());
  }
}

class RequestFailure extends Failure {
  const RequestFailure(super.message);
}
