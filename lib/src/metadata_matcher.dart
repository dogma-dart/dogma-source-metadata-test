// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

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
    if (actual != expected) {
      matchState[name] = 'expected ${expected.toString()} but actual is ${actual.toString()}';
      return false;
    }

    return true;
  }
}
