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

/// A matcher for [TypedMetadata] instances.
const Matcher isTypedMetadata = const isInstanceOf<TypedMetadata>();

/// A matcher for dynamic typed metadata.
final _IsType isDynamicType = new _IsType(dynamicType);

/// Matches the [type] on [TypedMetadata].
Matcher isType(TypeMetadata type) => new _IsType(type);

class _IsType extends Matcher {
  final TypeMetadata type;

  _IsType(this.type);

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! TypedMetadata) return false;

    return (item as TypedMetadata).type == type;
  }

  @override
  Description describe(Description description) => description.add('metadata type equal');
}
