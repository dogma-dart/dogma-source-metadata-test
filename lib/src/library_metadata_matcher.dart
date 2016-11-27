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

/// A [MetadataMatcher] for [LibraryMetadata] equality.
class LibraryMetadataMatcher extends MetadataMatcher<LibraryMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [LibraryMetadataMatcher] which compares metadata
  /// using the values in [expected].
  LibraryMetadataMatcher(LibraryMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as LibraryMetadata;

    matched = checkField(matchState, 'uri', actual.uri, expected.uri) && matched;
    matched = checkUnorderedList(matchState, 'imports', actual.imports, expected.imports) && matched;
    matched = checkUnorderedList(matchState, 'exports', actual.exports, expected.exports) && matched;
    matched = checkUnorderedList(matchState, 'classes', actual.classes, expected.classes) && matched;
    matched = checkUnorderedList(matchState, 'functions', actual.functions, expected.functions) && matched;
    matched = checkUnorderedList(matchState, 'fields', actual.fields, expected.fields) && matched;
    matched = checkUnorderedList(matchState, 'typedefs', actual.typedefs, expected.typedefs) && matched;

    return matched;
  }
}
