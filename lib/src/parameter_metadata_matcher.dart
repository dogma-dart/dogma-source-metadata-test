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

/// A [MetadataMatcher] for [ParameterMetadata] equality.
class ParameterMetadataMatcher extends MetadataMatcher<ParameterMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ParameterMetadataMatcher] which compares metadata
  /// using the values in [expected].
  ParameterMetadataMatcher(ParameterMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as ParameterMetadata;

    matched = checkField(matchState, 'type', actual.type, expected.type) && matched;
    matched = checkField(matchState, 'parameterKind', actual.parameterKind, expected.parameterKind) && matched;
    matched = checkField(matchState, 'isInitializer', actual.isInitializer, expected.isInitializer) && matched;
    matched = checkField(matchState, 'defaultValue', actual.defaultValue, expected.defaultValue) && matched;

    return matched;
  }
}
