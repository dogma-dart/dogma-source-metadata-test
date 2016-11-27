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
    final actual = new FieldMetadata('foo');
    final expected = new FieldMetadata('foo');

    expect(actual, metadataEqual(expected));
  });
  test('adding differences', () {
    final actual = new FieldMetadata(
        'foo',
        type: intType,
        isProperty: true,
        getter: true,
        setter: true,
        isAbstract: true,
        isConst: true,
        isFinal: true,
        isStatic: true,
        defaultValue: null
    );
    final expected = new FieldMetadata(
        'bar',
        type: boolType,
        isProperty: false,
        getter: false,
        setter: false,
        isAbstract: false,
        isConst: false,
        isFinal: false,
        isStatic: false,
        defaultValue: false
    );

    final matcher = metadataEqual(expected);
    final matchState = {};
    matcher.matches(actual, matchState);

    expect(matchState, hasLength(10));

    // Expect field names
    expect(matchState, contains('name'));
    expect(matchState, contains('type'));
    expect(matchState, contains('isProperty'));
    expect(matchState, contains('getter'));
    expect(matchState, contains('setter'));
    expect(matchState, contains('isAbstract'));
    expect(matchState, contains('isConst'));
    expect(matchState, contains('isFinal'));
    expect(matchState, contains('isStatic'));
    expect(matchState, contains('defaultValue'));
  });
}
