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

/// Matches the [ParameterKind] [value] on [ParameterMetadata].
Matcher parameterKind(ParameterKind value) => null;

/// Matcher for [ParameterMetadata] where the parameter is required.
const Matcher isRequiredParameter =
    const _IsParameterKind(ParameterKind.required);

/// Matcher for [ParameterMetadata] where the parameter is positional.
const Matcher isPositionalParameter =
    const _IsParameterKind(ParameterKind.positional);

/// Matcher for [ParameterMetadata] where the parameter is named.
const Matcher isNamedParameter =
    const _IsParameterKind(ParameterKind.named);

/// Matcher for [ParameterMetadata] that is an initializer.
const Matcher isInitializer = const _IsInitializer();

/// Matcher for [ParameterMetadata] that is not an initializer.
const Matcher isNotInitializer = const _IsNotInitializer();

class _IsParameterKind extends Matcher {
  final ParameterKind value;

  const _IsParameterKind(this.value);

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! ParameterMetadata) return false;

    return (item as ParameterMetadata).parameterKind == value;
  }

  @override
  Description describe(Description description) => description.add('parameter kind is $value');
}

class _IsInitializer extends Matcher {
  const _IsInitializer();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! ParameterMetadata) return false;

    return (item as ParameterMetadata).isInitializer;
  }

  @override
  Description describe(Description description) => description.add('parameter is initializer');
}

class _IsNotInitializer extends Matcher {
  const _IsNotInitializer();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! ParameterMetadata) return false;

    return !(item as ParameterMetadata).isInitializer;
  }

  @override
  Description describe(Description description) => description.add('parameter is not an initializer');
}
