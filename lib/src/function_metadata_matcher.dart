// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'package:dogma_source_metadata_test/src/metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [MetadataMatcher] for [FunctionMetadata] equality.
class FunctionMetadataMatcher<T extends FunctionMetadata> extends MetadataMatcher<T> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [FunctionMetadataMatcher] which compares metadata
  /// using the values in [expected].
  FunctionMetadataMatcher(FunctionMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as FunctionMetadata;

    matched = checkField(matchState, 'type', actual.returnType, expected.returnType) && matched;
    matched = checkField(matchState, 'isPrivate', actual.isPrivate, expected.isPrivate) && matched;

    return matched;
  }
}