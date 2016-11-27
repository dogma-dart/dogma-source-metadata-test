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

/// A matcher for [FunctionMetadata] instances.
const Matcher isFunctionMetadata = const isInstanceOf<FunctionMetadata>();

/// A matcher for an empty parameter list.
final Matcher noParameters = predicate((value) {
  if (value is! FunctionMetadata) return true;

  return (value as FunctionMetadata).parameters.isEmpty;
}, 'function has no parameters');

/// A matcher for a function which contains parameters.
final Matcher hasParameters = predicate((value) {
  if (value is! FunctionMetadata) return false;

  return (value as FunctionMetadata).parameters.isNotEmpty;
}, 'function has parameters');

/// Matches the [length] of parameters on [FunctionMetadata].
Matcher hasParameterLength(int length) =>
    predicate((value) {
      if (value is! FunctionMetadata) return false;

      return (value as FunctionMetadata).parameters.length == length;
    }, 'function has $length parameters');

/// Matches the return [type] of [FunctionMetadata].
Matcher returnsType(TypeMetadata type) =>
    predicate((value) {
      if (value is! FunctionMetadata) return false;

      return (value as FunctionMetadata).returnType == type;
    });
