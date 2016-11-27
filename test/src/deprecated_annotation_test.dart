
// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:dogma_source_metadata_test/test.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Metadata _deprecatedMetadata =
    new MethodMetadata('method', annotations: [deprecated]);
final Metadata _notDeprecatedMetadata =
    new MethodMetadata('method', annotations: [protected]);
final Metadata _notAnnotated = new Metadata('foo');

void main() {
  test('isDeprecated', () {
    final matcher = isDeprecated;

    expectMatch(matcher, _deprecatedMetadata);
    expectNoMatch(matcher, _notDeprecatedMetadata);
    expectNoMatch(matcher, _notAnnotated);
  });
  test('isNotDeprecated', () {
    final matcher = isNotDeprecated;

    expectNoMatch(matcher, _deprecatedMetadata);
    expectMatch(matcher, _notDeprecatedMetadata);
    expectMatch(matcher, _notAnnotated);
  });
}
