import 'package:connectify/library.dart';

extension Logger on Object? {
  void log() {
    if (kDebugMode) {
      print(this);
    }
  }
}
