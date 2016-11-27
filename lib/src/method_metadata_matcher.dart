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

/// A [MetadataMatcher] for [MethodMetadata] equality.
class MethodMetadataMatcher extends FunctionMetadataMatcher<MethodMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [MethodMetadataMatcher] which compares metadata
  /// using the values in [expected].
  MethodMetadataMatcher(MethodMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as MethodMetadata;

    matched = checkField(matchState, 'isAbstract', actual.isAbstract, expected.isAbstract) && matched;
    matched = checkField(matchState, 'isStatic', actual.isStatic, expected.isStatic) && matched;

    return matched;
  }
}
