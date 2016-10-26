// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Determine if the [expected] annotation is present on metadata.
///
/// This assumes that [expected] can be compared. If not then it will not
/// function properly. A [description] can be added if necessary.
Matcher annotatedWith(dynamic expected, [String description]) =>
    predicate((value) {
      if (value is! Annotated) return false;

      return (value as Annotated).annotations.contains(expected);
    }, description ?? 'has annotation $expected');

/// Determine if the [expected] annotation is not present on metadata.
///
/// This assumes that [expected] can be compared. If not then it will not
/// function properly. A [description] can be added if necessary.
Matcher notAnnotatedWith(dynamic expected, [String description]) =>
    predicate((value) {
      if (value is! Annotated) return true;

      return (value as Annotated).annotations.contains(expected);
    }, description ?? 'has annotation $expected');

/// Determine if the metadata does not contain any annotations.
Matcher notAnnotated = predicate((value) {
  if (value is! Annotated) return true;

  return (value as Annotated).annotations.isEmpty;
});
