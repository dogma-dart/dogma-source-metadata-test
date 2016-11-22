// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';

import 'metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [MetadataMatcher] for [ClassMetadata] equality.
class ClassMetadataMatcher extends MetadataMatcher<ClassMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [ClassMetadataMatcher] which compares metadata
  /// using the values in [expected].
  ClassMetadataMatcher(ClassMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as ClassMetadata;

    matched = checkField(matchState, 'isAbstract', actual.isAbstract, expected.isAbstract) && matched;
    matched = checkField(matchState, 'supertype', actual.supertype, expected.supertype) && matched;
    matched = checkUnorderedList(matchState, 'interfaces', actual.interfaces, expected.interfaces) && matched;
    matched = checkUnorderedList(matchState, 'mixins', actual.mixins, expected.mixins) && matched;
    matched = checkOrderedList(matchState, 'typeParameters', actual.typeParameters, expected.typeParameters) && matched;
    matched = checkUnorderedList(matchState, 'fields', actual.fields, expected.fields) && matched;
    matched = checkUnorderedList(matchState, 'methods', actual.methods, expected.methods) && matched;
    matched = checkUnorderedList(matchState, 'constructors', actual.constructors, expected.constructors) && matched;

    return matched;
  }
}
