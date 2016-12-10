// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Matcher for checking if metadata is uncommented.
final Matcher uncommented = predicate((value) {
  if (value is! Commented) return true;

  return (value as Commented).comments.isEmpty;
}, 'metadata is uncommented');

/// Matcher for checking if metadata is commented.
final Matcher commented = predicate((value) {
  if (value is! Commented) return false;

  return (value as Commented).comments.isNotEmpty;
}, 'metadata is commented');

/// Matcher to see if the [comment] is present on the metadata.
Matcher commentedWith(String comment) =>
    predicate((value) {
      if (value is! Commented) return false;

      return (value as Commented).comments == comment;
    }, 'metadata is commented with "$comment"');
