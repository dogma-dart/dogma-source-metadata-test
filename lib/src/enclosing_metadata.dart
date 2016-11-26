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

/// A matcher which verifies that [metadata] encloses the value.
///
/// This matcher uses `identical` to ensure that the enclosing metadata is the
/// exact instance specified in [metadata].
Matcher enclosedBy(EnclosingMetadata metadata) =>
    predicate((value) {
      if (value is! EnclosedMetadata) return false;

      return identical((value as EnclosedMetadata).enclosingMetadata, metadata);
    });
