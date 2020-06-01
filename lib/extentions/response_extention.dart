import 'package:chopper/chopper.dart';

extension ResponseExtention on Response {
  bool get isSuccessful => this.statusCode >= 200 && this.statusCode < 300;
}
