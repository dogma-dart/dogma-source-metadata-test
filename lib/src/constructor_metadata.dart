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

/// A matcher for [ConstructorMetadata] instances.
const Matcher isConstructorMetadata = const isInstanceOf<ConstructorMetadata>();

/// A matcher for the a default constructor.
final Matcher isDefaultConstructor = predicate((value) {
  if (value is! ConstructorMetadata) return false;

  return (value as ConstructorMetadata).isDefault;
}, 'constructor is default');

/// A matcher for a named constructor.
final Matcher isNamedConstructor = predicate((value) {
  if (value is! ConstructorMetadata) return false;

  return !(value as ConstructorMetadata).isDefault;
}, 'constructor is named');
