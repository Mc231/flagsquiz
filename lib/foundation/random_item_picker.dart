import 'package:flags_quiz/foundation/random_pick_result.dart';

/// A utility class for randomly selecting items from a list.
///
/// The `RandomItemPicker` class provides functionality to pick random items
/// from a list, offering a selection of options with one correct answer.
/// It is designed to facilitate quiz or game scenarios where random options
/// need to be presented to the user. The class manages previously selected
/// items to ensure variety in subsequent picks.
///
/// The class can be configured with a specific number of options to pick,
/// and defaults to a count of 4 options if not specified.
///
/// Example usage:
/// ```dart
/// final itemPicker = RandomItemPicker(['Apple', 'Banana', 'Cherry']);
/// RandomPickResult result = itemPicker.pick();
/// print('Answer: ${result.answer}, Options: ${result.options}');
/// ```
class RandomItemPicker<T> {
  /// The list of items from which random selections are made.
  final List<T> items;

  /// The number of options to include in each pick.
  final int count;

  /// A list of items that have already been answered.
  final List<T> _answeredItems = [];

  /// The default number of options to pick if none is specified.
  static const _defaultCount = 4;

  /// Creates a `RandomItemPicker` with a given list of [items].
  ///
  /// [items] is the list of items available for random selection.
  /// [count] is the number of options to pick; defaults to [_defaultCount] (4).
  RandomItemPicker(this.items, [this.count = _defaultCount]);

  /// Replaces the current list of items with a new list.
  ///
  /// This method clears the existing list of items and replaces it with
  /// the provided [items]. It is useful for resetting the item pool between
  /// rounds or sessions.
  void replaceItems(List<T> items) {
    this.items.clear();
    this.items.addAll(items);
  }

  /// Picks a random item and its options from the list.
  ///
  /// This method shuffles the items and selects a random answer with additional
  /// options, ensuring that one of the options is the correct answer.
  ///
  /// Returns a `RandomPickResult` containing the answer and options, or `null`
  /// if there are no items available for picking.
  RandomPickResult<T>? pick() {
    if (count >= items.length) {
      if (items.isEmpty) {
        print('Items are empty');
        return null;
      }
      items.shuffle();
      var answer = (items..shuffle()).first;
      _answeredItems.shuffle();
      var options = _answeredItems.sublist(0, count - 1);
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

  /// Creates a `RandomPickResult` with the given answer and options.
  ///
  /// This method removes the [answer] from the list of items, adds it to the
  /// list of answered items, and returns a new `RandomPickResult`.
  ///
  /// [answer] is the correct answer among the options.
  /// [options] is the list of options presented, including the answer.
  RandomPickResult<T> _createResult(T answer, List<T> options) {
    items.remove(answer);
    _answeredItems.add(answer);
    return RandomPickResult(answer, options);
  }
}