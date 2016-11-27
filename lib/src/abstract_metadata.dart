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

/// A matcher for [AbstractMetadata] instances.
const Matcher isAbstractMetadata = const isInstanceOf<AbstractMetadata>();

/// A matcher for abstract metadata.
final Matcher isAbstract = predicate((value) {
  if (value is! AbstractMetadata) return false;

  return (value as AbstractMetadata).isAbstract;
}, 'metadata is abstract');

/// A matcher for concrete metadata.
final Matcher isConcrete = predicate((value) {
  if (value is! AbstractMetadata) return true;

  return !(value as AbstractMetadata).isAbstract;
}, 'metadata is concrete');
