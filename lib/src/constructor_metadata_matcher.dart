// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';

import 'function_metadata_matcher.dart';
import 'metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [MetadataMatcher] for [ConstructorMetadata] equality.
class ConstructorMetadataMatcher extends FunctionMetadataMatcher<ConstructorMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ConstructorMetadataMatcher] which compares metadata
  /// using the values in [expected].
  ConstructorMetadataMatcher(ConstructorMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as ConstructorMetadata;

    matched = checkField(matchState, 'isConst', actual.isConst, expected.isConst) && matched;
    matched = checkField(matchState, 'isFactory', actual.isFactory, expected.isFactory) && matched;

    return matched;
  }
}
