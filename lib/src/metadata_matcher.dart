// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'metadata.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Base class for determining equality in [Metadata].
///
/// The [MetadataMatcher] extends the [Matcher] interface and is meant to be
/// used within the test framework.
class MetadataMatcher<T extends Metadata> extends Matcher {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  /// The value to compare against.
  final T expected;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [MetadataMatcher] which compares metadata using
  /// the values in [expected].
  MetadataMatcher(this.expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    final actual = item as Metadata;
    return checkField(matchState, 'name', actual.name, expected.name);
  }

  @override
  Description describe(Description description) =>
      description.add('metadata is equal');

  @override
  Description describeMismatch(dynamic item,
                               Description mismatchDescription,
                               Map matchState,
                               bool verbose) {
    matchState.forEach((key, value) {
      mismatchDescription.add(key).addDescriptionOf(value);
    });

    return mismatchDescription;
  }

  //---------------------------------------------------------------------
  // Protected methods
  //---------------------------------------------------------------------

  /// Compares the values of [actual] vs [expected].
  ///
  /// If the values are not equal then a description of the discrepancy is
  /// added to the [matchState] under the [name].
  @protected
  bool checkField(Map matchState, String name, dynamic actual, dynamic expected) {
    final matcher = _matcher(expected);

    return _checkMatch(matchState, name, actual, matcher);
  }

  /// Compares the values of [actual] vs [expected] respecting ordering.
  ///
  /// This should be used when the order of the values matters. If it does not
  /// use [checkUnorderedList] instead.
  @protected
  bool checkOrderedList(Map matchState, String name, List actual, List expected) {
    final matcher = equals(_matcherList(expected).toList());

    return _checkMatch(matchState, name, actual, matcher);
  }

  /// Compares the values of [actual] vs [expected] without respecting
  /// ordering.
  ///
  /// This should be used when the order of the values does not matter. If it
  /// does use [checkOrderedList] instead.
  @protected
  bool checkUnorderedList(Map matchState, String name, List actual, List expected) {
    final matcher = equals(_matcherList(expected).toSet());

    return _checkMatch(matchState, name, actual, matcher);
  }

  //---------------------------------------------------------------------
  // Private class methods
  //---------------------------------------------------------------------

  /// Checks the [actual] value against the [matcher].
  static bool _checkMatch(Map matchState, String name, dynamic actual, Matcher matcher) {
    final valueMatchState = {};
    final matches = matcher.matches(actual, valueMatchState);

    if (!matches) {
      matchState[name] = valueMatchState;
    }

    return matches;
  }

  /// Create matchers for the given list of [expected] values.
  static Iterable<Matcher> _matcherList(List expected) =>
      expected.map<Matcher>((value) => _matcher(value));

  /// Creates a matcher for the [expected] value.
  ///
  /// If the [expected] value is metadata then a [MetadataMatcher] will be
  /// returned. Otherwise it will do an [equals] check.
  static Matcher _matcher(dynamic expected) {
    var matcher;

    if (expected is Metadata) {
      matcher = metadataEqual(expected);
    }

    return matcher ?? equals(expected);
  }
}
