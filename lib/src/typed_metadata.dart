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

/// A matcher for [TypedMetadata] instances.
const Matcher isTypedMetadata = const isInstanceOf<TypedMetadata>();

/// A matcher for dynamic typed metadata.
final Matcher isDynamicType = isType(dynamicType);

/// Matches the [expected] type on [TypedMetadata].
Matcher isType(TypeMetadata expected) =>
    predicate((value) {
      if (value is! TypedMetadata) return false;

      return (value as TypedMetadata).type == expected;
    }, 'metadata type is equal to $expected');
