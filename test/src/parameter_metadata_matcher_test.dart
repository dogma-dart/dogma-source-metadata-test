// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:test/test.dart';

import 'package:dogma_source_metadata_test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('equality', () {
    final actual = new ParameterMetadata('foo');
    final expected = new ParameterMetadata('foo');

    expect(actual, metadataEqual(expected));
  });
  test('adding differences', () {
    final actual = new ParameterMetadata(
        'foo',
        type: intType,
        parameterKind: ParameterKind.named,
        isInitializer: false,
        defaultValue: null
    );
    final expected = new ParameterMetadata(
        'bar',
        type: boolType,
        parameterKind: ParameterKind.positional,
        isInitializer: true,
        defaultValue: true
    );

    final matcher = metadataEqual(expected);
    final matchState = {};
    matcher.matches(actual, matchState);

    expect(matchState, hasLength(5));

    // Expect field names
    expect(matchState, contains('name'));
    expect(matchState, contains('type'));
    expect(matchState, contains('parameterKind'));
    expect(matchState, contains('isInitializer'));
    expect(matchState, contains('defaultValue'));
  });
}
