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

/// A matcher for [StaticMetadata] instances.
const Matcher isStaticMetadata = const isInstanceOf<StaticMetadata>();

/// A matcher for static metadata.
final Matcher isStatic = predicate((value) {
  if (value is! StaticMetadata) return false;

  return (value as StaticMetadata).isStatic;
}, 'metadata is static');

/// A matcher for concrete metadata.
final Matcher isNotStatic = predicate((value) {
  if (value is! StaticMetadata) return true;

  return !(value as StaticMetadata).isStatic;
}, 'metadata is not static');
