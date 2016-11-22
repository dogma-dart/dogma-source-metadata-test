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

final Metadata _constantMetadata = new ConstructorMetadata(interfaceType('Foo'), isConst: true);
final Metadata _notConstantMetadata = new ConstructorMetadata(interfaceType('Foo'), isConst: false);
final Metadata _notConstantMetadataType = new ParameterMetadata('param');

void main() {
  test('isConstantMetadata', () {
    final matcher = isConstantMetadata;

    expectMatch(matcher, _constantMetadata);
    expectMatch(matcher, _notConstantMetadata);
    expectNoMatch(matcher, _notConstantMetadataType);
  });
  test('isConstant', () {
    final matcher = isConstant;

    expectMatch(matcher, _constantMetadata);
    expectNoMatch(matcher, _notConstantMetadata);
    expectNoMatch(matcher, _notConstantMetadataType);
  });
  test('isNotConstant', () {
    final matcher = isNotConstant;

    expectNoMatch(matcher, _constantMetadata);
    expectMatch(matcher, _notConstantMetadata);
    expectMatch(matcher, _notConstantMetadataType);
  });
}
