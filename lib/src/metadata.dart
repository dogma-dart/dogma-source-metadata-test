// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';
import 'package:dogma_source_analyzer/metadata.dart';

import 'function_metadata_matcher.dart';
import 'parameter_metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Returns a matcher that checks for equality between metadata.
///
/// The metadata matcher is not able to check for annotations.
Matcher metadataEqual(Metadata expected) {
  var matcher;

  if (expected is ParameterMetadata) {
    matcher = new ParameterMetadataMatcher(expected);
  }

  return matcher;
}

/// Returns a matcher that checks the [name] on metadata.
Matcher isNamed(String expected) =>
    predicate((value) {
      if (value is! Metadata) return false;

      return (value as Metadata).name == expected;
    }, 'metadata is named $expected');
