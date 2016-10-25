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
const _IsConstant isConstant = const _IsConstant();

/// A matcher for concrete metadata.
const _IsNotConstant isNotConstant = const _IsNotConstant();

class _IsConstant extends Matcher {
  const _IsConstant();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! ConstantMetadata) return false;

    return (item as ConstantMetadata).isConst;
  }

  @override
  Description describe(Description description) => description.add('metadata is constant');
}

class _IsNotConstant extends Matcher {
  const _IsNotConstant();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! ConstantMetadata) return true;

    return !(item as ConstantMetadata).isConst;
  }

  @override
  Description describe(Description description) => description.add('metadata is not constant');
}
