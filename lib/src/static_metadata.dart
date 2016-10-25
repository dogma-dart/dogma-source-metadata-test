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

/// A matcher for [StaticMetadata] instances.
const Matcher isStaticMetadata = const isInstanceOf<StaticMetadata>();

/// A matcher for static metadata.
const _IsStatic isStatic = const _IsStatic();

/// A matcher for concrete metadata.
const _IsNotStatic isNotStatic = const _IsNotStatic();

class _IsStatic extends Matcher {
  const _IsStatic();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! StaticMetadata) return false;

    return (item as StaticMetadata).isStatic;
  }

  @override
  Description describe(Description description) => description.add('metadata is static');
}

class _IsNotStatic extends Matcher {
  const _IsNotStatic();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! StaticMetadata) return true;

    return !(item as StaticMetadata).isStatic;
  }

  @override
  Description describe(Description description) => description.add('metadata is not static');
}
