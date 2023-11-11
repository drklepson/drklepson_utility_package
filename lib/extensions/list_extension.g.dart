extension ForListWhereNull<T> on List<T> {
  T? firstWhereNull(bool Function(T element) rule) {
    if (isEmpty) return null;
    for (final i in this) {
      if (rule.call(i)) {
        return i;
      }
    }
    return null;
  }
}
