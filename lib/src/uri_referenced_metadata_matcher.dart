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

/// A [MetadataMatcher] for [UriReferencedMetadata] equality.
class UriReferencedMetadataMatcher extends MetadataMatcher<UriReferencedMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [UriReferencedMetadataMatcher] which compares
  /// metadata using the values in [expected].
  UriReferencedMetadataMatcher(UriReferencedMetadata expected)
      : super(expected);

  //---------------------------------------------------------------------
  // Matcher
  //---------------------------------------------------------------------

  @override
  bool matches(dynamic item, Map matchState) {
    var matched = super.matches(item, matchState);
    final actual = item as UriReferencedMetadata;

    matched = checkField(matchState, 'prefix', actual.prefix, expected.prefix) && matched;
    matched = checkUnorderedList(matchState, 'shownNames', actual.shownNames, expected.shownNames) && matched;
    matched = checkUnorderedList(matchState, 'hiddenNames', actual.hiddenNames, expected.hiddenNames) && matched;

    return matched;
  }
}
