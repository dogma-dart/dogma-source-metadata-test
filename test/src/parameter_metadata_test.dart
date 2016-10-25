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

final Metadata _requiredParameterMetadata = new ParameterMetadata('r', parameterKind: ParameterKind.required);
final Metadata _positionalParameterMetadata = new ParameterMetadata('r', parameterKind: ParameterKind.positional);
final Metadata _namedParameterMetadata = new ParameterMetadata('r', parameterKind: ParameterKind.named);
final Metadata _notParameterMetadataType = new ClassMetadata('C');

void main() {
  test('isParameterMetadata', () {
    final matcher = isParameterMetadata;

    expectMatch(matcher, _requiredParameterMetadata);
    expectMatch(matcher, _positionalParameterMetadata);
    expectMatch(matcher, _namedParameterMetadata);
    expectNoMatch(matcher, _notParameterMetadataType);
  });
  test('isRequiredParameter', () {
    final matcher = isRequiredParameter;

    expectMatch(matcher, _requiredParameterMetadata);
    expectNoMatch(matcher, _positionalParameterMetadata);
    expectNoMatch(matcher, _namedParameterMetadata);
    expectNoMatch(matcher, _notParameterMetadataType);
  });
  test('isRequiredParameter', () {
    final matcher = isPositionalParameter;

    expectNoMatch(matcher, _requiredParameterMetadata);
    expectMatch(matcher, _positionalParameterMetadata);
    expectNoMatch(matcher, _namedParameterMetadata);
    expectNoMatch(matcher, _notParameterMetadataType);
  });
  test('isRequiredParameter', () {
    final matcher = isNamedParameter;

    expectNoMatch(matcher, _requiredParameterMetadata);
    expectNoMatch(matcher, _positionalParameterMetadata);
    expectMatch(matcher, _namedParameterMetadata);
    expectNoMatch(matcher, _notParameterMetadataType);
  });
}
