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

/// A matcher for [ConstantMetadata] instances.
const Matcher isConstantMetadata = const isInstanceOf<ConstantMetadata>();

/// A matcher for constant metadata.
final Matcher isConstant = predicate((value) {
  if (value is! ConstantMetadata) return false;

  return (value as ConstantMetadata).isConst;
}, 'metadata is constant');

/// A matcher for concrete metadata.
final Matcher isNotConstant = predicate((value) {
  if (value is! ConstantMetadata) return true;

  return !(value as ConstantMetadata).isConst;
}, 'metadata is not constant');
