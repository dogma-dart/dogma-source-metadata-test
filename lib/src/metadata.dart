// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';
import 'package:dogma_source_metadata/metadata.dart';

import 'constructor_metadata_matcher.dart';
import 'class_metadata_matcher.dart';
import 'field_metadata_matcher.dart';
import 'function_metadata_matcher.dart';
import 'library_metadata_matcher.dart';
import 'method_metadata_matcher.dart';
import 'parameter_metadata_matcher.dart';
import 'typedef_metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Returns a matcher that checks for equality between metadata.
///
/// The metadata matcher is not able to check for annotations.
Matcher metadataEqual(Metadata expected) {
  var matcher;

  if (expected is ConstructorMetadata) {
    matcher = new ConstructorMetadataMatcher(expected);
  } else if (expected is MethodMetadata) {
    matcher = new MethodMetadataMatcher(expected);
  } else if (expected is TypedefMetadata) {
    matcher = new TypedefMetadataMatcher(expected);
  } else if (expected is FunctionMetadata) {
    matcher = new FunctionMetadataMatcher(expected);
  } else if (expected is ParameterMetadata) {
    matcher = new ParameterMetadataMatcher(expected);
  } else if (expected is FieldMetadata) {
    matcher = new FieldMetadataMatcher(expected);
  } else if (expected is ClassMetadata) {
    matcher = new ClassMetadataMatcher(expected);
  } else if (expected is LibraryMetadata) {
    matcher = new LibraryMetadataMatcher(expected);
  }

  return matcher;
}

/// Returns a matcher that checks the [expected] name on metadata.
Matcher isNamed(String expected) =>
    predicate((value) {
      if (value is! Metadata) return false;

      return (value as Metadata).name == expected;
    }, 'metadata is named $expected');
