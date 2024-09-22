// ignore_for_file: avoid_print

void devLog(Object obj) {
  assert(() {
    const splitCount = 500;
    final string = '$obj';
    var i = 0;
    for (; (i + splitCount) < string.length; i += splitCount) {
      print(string.substring(i, i + splitCount));
    }
    print(string.substring(i));
    return true;
  }());
}
