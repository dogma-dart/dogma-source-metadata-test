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

/// A matcher for [AbstractMetadata] instances.
const Matcher isAbstractMetadata = const isInstanceOf<AbstractMetadata>();

/// A matcher for abstract metadata.
const _IsAbstract isAbstract = const _IsAbstract();

/// A matcher for concrete metadata.
const _IsConcrete isConcrete = const _IsConcrete();

class _IsAbstract extends Matcher {
  const _IsAbstract();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! AbstractMetadata) return false;

    return (item as AbstractMetadata).isAbstract;
  }

  @override
  Description describe(Description description) => description.add('metadata is abstract');
}

class _IsConcrete extends Matcher {
  const _IsConcrete();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! AbstractMetadata) return true;

    return !(item as AbstractMetadata).isAbstract;
  }

  @override
  Description describe(Description description) => description.add('metadata is concrete');
}
