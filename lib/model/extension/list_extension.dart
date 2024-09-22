extension ListExtension<E> on List<E> {
  List<T> mapIndexed<T>(T Function(int index, E item) f) {
    var index = 0;
    return map((e) => f(index++, e)).toList();
  }
}
