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

/// Matcher for [ParameterMetadata] instances.
const Matcher isParameterMetadata = const isInstanceOf<ParameterMetadata>();

/// Matches the [ParameterKind] [expected] value on [ParameterMetadata].
Matcher parameterKind(ParameterKind expected) =>
    predicate((value) {
      if (value is! ParameterMetadata) return false;

      return (value as ParameterMetadata).parameterKind == expected;
    }, 'parameter kind is $expected');

/// Matcher for [ParameterMetadata] where the parameter is required.
final Matcher isRequiredParameter = parameterKind(ParameterKind.required);

/// Matcher for [ParameterMetadata] where the parameter is positional.
final Matcher isPositionalParameter = parameterKind(ParameterKind.positional);

/// Matcher for [ParameterMetadata] where the parameter is named.
final Matcher isNamedParameter = parameterKind(ParameterKind.named);

/// Matcher for [ParameterMetadata] that is an initializer.
final Matcher isInitializer = predicate((value) {
  if (value is! ParameterMetadata) return false;

  return (value as ParameterMetadata).isInitializer;
}, 'parameter is initializer');

/// Matcher for [ParameterMetadata] that is not an initializer.
final Matcher isNotInitializer = predicate((value) {
  if (value is! ParameterMetadata) return false;

  return !(value as ParameterMetadata).isInitializer;
}, 'parameter is not an initializer');
