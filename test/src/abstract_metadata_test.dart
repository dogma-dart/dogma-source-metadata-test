// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:dogma_source_metadata_test/test.dart';
import 'package:test/test.dart';

import 'matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Metadata _abstractMetadata = new ClassMetadata('A', isAbstract: true);
final Metadata _concreteMetadata = new ClassMetadata('C', isAbstract: false);
final Metadata _notAbstractMetadataType = new ParameterMetadata('param');

void main() {
  test('isAbstractMetadata', () {
    final matcher = isAbstractMetadata;

    expectMatch(matcher, _abstractMetadata);
    expectMatch(matcher, _concreteMetadata);
    expectNoMatch(matcher, _notAbstractMetadataType);
  });
  test('isAbstract', () {
    final matcher = isAbstract;

    expectMatch(matcher, _abstractMetadata);
    expectNoMatch(matcher, _concreteMetadata);
    expectNoMatch(matcher, _notAbstractMetadataType);
  });
  test('isConcrete', () {
    final matcher = isConcrete;

    expectNoMatch(matcher, _abstractMetadata);
    expectMatch(matcher, _concreteMetadata);
    expectMatch(matcher, _notAbstractMetadataType);
  });
}
