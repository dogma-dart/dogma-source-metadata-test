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

final Metadata _privateMetadata = new ClassMetadata('_P');
final Metadata _publicMetadata = new ClassMetadata('P');
final Metadata _notPrivacyMetadataType = new ParameterMetadata('param');

void main() {
  test('isPrivacyMetadata', () {
    final matcher = isPrivacyMetadata;

    expectMatch(matcher, _privateMetadata);
    expectMatch(matcher, _publicMetadata);
    expectNoMatch(matcher, _notPrivacyMetadataType);
  });
  test('isPrivate', () {
    final matcher = isPrivate;

    expectMatch(matcher, _privateMetadata);
    expectNoMatch(matcher, _publicMetadata);
    expectNoMatch(matcher, _notPrivacyMetadataType);
  });
  test('isPublic', () {
    final matcher = isPublic;

    expectNoMatch(matcher, _privateMetadata);
    expectMatch(matcher, _publicMetadata);
    expectMatch(matcher, _notPrivacyMetadataType);
  });
}
