
// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:dogma_source_metadata_test/test.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

final Metadata _overriddenMetadata =
    new MethodMetadata('method', annotations: [override]);
final Metadata _notOverriddenMetadata =
    new MethodMetadata('method', annotations: [protected]);
final Metadata _notAnnotated = new Metadata('foo');

void main() {
  test('isOverridden', () {
    final matcher = isOverridden;

    expectMatch(matcher, _overriddenMetadata);
    expectNoMatch(matcher, _notOverriddenMetadata);
    expectNoMatch(matcher, _notAnnotated);
  });
  test('isNotOverridden', () {
    final matcher = isNotOverridden;

    expectNoMatch(matcher, _overriddenMetadata);
    expectMatch(matcher, _notOverriddenMetadata);
    expectMatch(matcher, _notAnnotated);
  });
}
