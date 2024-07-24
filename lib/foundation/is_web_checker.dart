import 'package:flutter/foundation.dart';

abstract class IsWebChecker {
  bool isWeb();
  const IsWebChecker();
}

class IsWebCheckerImpl extends IsWebChecker {

  const IsWebCheckerImpl();

  @override
  bool isWeb() {
    return kIsWeb;
  }
}
