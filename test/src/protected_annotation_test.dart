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

final Metadata _protectedMetadata =
    new MethodMetadata('method', annotations: [protected]);
final Metadata _notProtectedMetadata =
    new MethodMetadata('method', annotations: [override]);
final Metadata _notAnnotated = new Metadata('foo');

void main() {
  test('isProtected', () {
    final matcher = isProtected;

    expectMatch(matcher, _protectedMetadata);
    expectNoMatch(matcher, _notProtectedMetadata);
    expectNoMatch(matcher, _notAnnotated);
  });
  test('isNotProtected', () {
    final matcher = isNotProtected;

    expectNoMatch(matcher, _protectedMetadata);
    expectMatch(matcher, _notProtectedMetadata);
    expectMatch(matcher, _notAnnotated);
  });
}
