// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_metadata_test/test.dart';
import 'package:test/test.dart';

import 'matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('isTypedMetadata', () {
    final matcher = isTypedMetadata;

    expectMatch(matcher, new ClassMetadata('C'));
    expectMatch(matcher, new ParameterMetadata('p'));
    expectNoMatch(matcher, new UriReferencedMetadata());
  });
  test('isType', () {
    final matcher = isType(new TypeMetadata('Foo'));

    expectMatch(matcher, new ClassMetadata('Foo'));
    expectNoMatch(matcher, new ClassMetadata('Bar'));
  });
  test('isDynamicType', () {
    final matcher = isDynamicType;

    expectMatch(matcher, new ParameterMetadata('p', type: new TypeMetadata.dynamic()));
    expectNoMatch(matcher, new ParameterMetadata('p', type: new TypeMetadata.int()));
  });
}
