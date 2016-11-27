// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';

import 'metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [MetadataMatcher] for [FieldMetadata] equality.
class FieldMetadataMatcher extends MetadataMatcher<FieldMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [FieldMetadataMatcher] which compares metadata
  /// using the values in [expected].
  FieldMetadataMatcher(FieldMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as FieldMetadata;

    matched = checkField(matchState, 'type', actual.type, expected.type) && matched;
    matched = checkField(matchState, 'isProperty', actual.isProperty, expected.isProperty) && matched;
    matched = checkField(matchState, 'getter', actual.getter, expected.getter) && matched;
    matched = checkField(matchState, 'setter', actual.setter, expected.setter) && matched;
    matched = checkField(matchState, 'isAbstract', actual.isAbstract, expected.isAbstract) && matched;
    matched = checkField(matchState, 'isConst', actual.isConst, expected.isConst) && matched;
    matched = checkField(matchState, 'isFinal', actual.isFinal, expected.isFinal) && matched;
    matched = checkField(matchState, 'isStatic', actual.isStatic, expected.isStatic) && matched;
    matched = checkField(matchState, 'defaultValue', actual.defaultValue, expected.defaultValue) && matched;

    return matched;
  }
}
