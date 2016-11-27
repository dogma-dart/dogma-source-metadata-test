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

class _TestAnnotation {
  final int value;
  const _TestAnnotation(this.value);
}

const _testAnnotation = const _TestAnnotation(3);

final AnnotatedMetadata _annotated =
    new AnnotatedMetadata('annotated', [_testAnnotation], '');
final AnnotatedMetadata _notAnnotated =
    new AnnotatedMetadata('notAnnotated', [], '');
final Metadata _notAnnotatedMetadataType = new Metadata('foo');

bool _annotationCheck(dynamic actual, _TestAnnotation expected) {
  if (actual is! _TestAnnotation) return false;

  return actual.value == expected.value;
}

void main() {
  test('isAnnotated', () {
    final matcher = isAnnotated;

    expectMatch(matcher, _annotated);
    expectNoMatch(matcher, _notAnnotated);
    expectNoMatch(matcher, _notAnnotatedMetadataType);
  });
  test('notAnnotated', () {
    final matcher = notAnnotated;

    expectNoMatch(matcher, _annotated);
    expectMatch(matcher, _notAnnotated);
    expectMatch(matcher, _notAnnotatedMetadataType);
  });
  test('hasAnnotations', () {
    final matcher = hasAnnotations(1);

    expectMatch(matcher, _annotated);
    expectNoMatch(matcher, _notAnnotated);
    expectNoMatch(matcher, _notAnnotatedMetadataType);
  });
  test('hasAnnotation', () {
    final matcher = hasAnnotation(_annotationCheck, _testAnnotation);

    expectMatch(matcher, _annotated);
    expectNoMatch(matcher, _notAnnotated);
    expectNoMatch(matcher, _notAnnotatedMetadataType);
  });
  test('missingAnnotation', () {
    final matcher = missingAnnotation(_annotationCheck, _testAnnotation);

    expectNoMatch(matcher, _annotated);
    expectMatch(matcher, _notAnnotated);
    expectMatch(matcher, _notAnnotatedMetadataType);
  });
}
