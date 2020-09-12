import 'package:flagsquiz/foundation/random_pick_result.dart';

class RandomItemPicker<T> {

  final List<T> items;
  final int count;

  final List<T> _answeredItems = [];

  static const _defaultCount = 4;

  RandomItemPicker(this.items, [this.count = _defaultCount]);

  /// Clear and replace all items
  void replaceItems(List<T> items) {
    this.items.clear();
    this.items.addAll(items);
  }

  RandomPickResult<T> pick() {
    if (count >= items.length) {
      if (items.isEmpty) {
        print('Items are empty');
        return null;
      }
      items.shuffle();
      var answer = (items..shuffle()).first;
      _answeredItems.shuffle();
      var options = _answeredItems.sublist(0, _defaultCount - 1);
      options.add(answer);
      options.shuffle();
      return _createResult(answer, options);
    }
    items.shuffle();
    var options = items.sublist(0, _defaultCount);
    var answer = (options..shuffle()).first;
    options.shuffle();
    return _createResult(answer, options);
  }

  RandomPickResult<T> _createResult(T answer, List<T> options) {
    items.remove(answer);
    _answeredItems.add(answer);
    return RandomPickResult(answer, options);
  }
}
