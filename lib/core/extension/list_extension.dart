import 'package:flutter/widgets.dart';

extension ListExtension<T> on List<T> {
  /// Maps each element and its index to a new value.
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    for (int index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}

extension ListWidgetrExtension on List<Widget> {
  List<Widget> applySeparator(Widget separator) {
    return mapIndexed((int index, Widget item) => <Widget>[
          if (index != 0) separator,
          item,
        ]).expand((List<Widget> element) => element).toList();
  }
}
