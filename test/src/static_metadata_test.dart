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

final Metadata _staticMetadata = new MethodMetadata('s', isStatic: true);
final Metadata _notStaticMetadata = new MethodMetadata('i', isStatic: false);
final Metadata _notStaticMetadataType = new ParameterMetadata('param');

void main() {
  test('isStaticMetadata', () {
    final matcher = isStaticMetadata;

    expectMatch(matcher, _staticMetadata);
    expectMatch(matcher, _notStaticMetadata);
    expectNoMatch(matcher, _notStaticMetadataType);
  });
  test('isStatic', () {
    final matcher = isStatic;

    expectMatch(matcher, _staticMetadata);
    expectNoMatch(matcher, _notStaticMetadata);
    expectNoMatch(matcher, _notStaticMetadataType);
  });
  test('isNotStatic', () {
    final matcher = isNotStatic;

    expectNoMatch(matcher, _staticMetadata);
    expectMatch(matcher, _notStaticMetadata);
    expectMatch(matcher, _notStaticMetadataType);
  });
}
