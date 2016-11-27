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

final Metadata _typedefMetadata = new TypedefMetadata('T');
final Metadata _notTypedefMetadataType = new ClassMetadata('C');

void main() {
  test('isTypedefMetadata', () {
    final matcher = isTypedefMetadata;

    expectMatch(matcher, _typedefMetadata);
    expectNoMatch(matcher, _notTypedefMetadataType);
  });
}
