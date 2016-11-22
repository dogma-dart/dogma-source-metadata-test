// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:test/test.dart';

import 'package:dogma_source_metadata_test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

void main() {
  test('equality', () {
    final actual = new ConstructorMetadata(
        interfaceType('Foo'),
        parameters: <ParameterMetadata>[
          new ParameterMetadata('a'),
          new ParameterMetadata('b'),
        ]
    );
    final expected = new ConstructorMetadata(
        interfaceType('Foo'),
        parameters: <ParameterMetadata>[
          new ParameterMetadata('a'),
          new ParameterMetadata('b'),
        ]
    );

    expect(actual, metadataEqual(expected));
  });
  test('adding differences', () {
    final actual = new ConstructorMetadata(
        interfaceType('Foo'),
        name: 'foo',
        parameters: <ParameterMetadata>[
          new ParameterMetadata('a'),
          new ParameterMetadata('b')
        ],
        isConst: true,
        isFactory: false
    );
    final expected = new ConstructorMetadata(
        interfaceType('Bar'),
        name: 'bar',
        parameters: <ParameterMetadata>[
          new ParameterMetadata('c')
        ],
        isConst: false,
        isFactory: true
    );

    final matcher = metadataEqual(expected);
    final matchState = {};
    matcher.matches(actual, matchState);

    expect(matchState, hasLength(5));

    // Expect field names
    expect(matchState, contains('name'));
    expect(matchState, contains('returnType'));
    expect(matchState, contains('parameters'));
    expect(matchState, contains('isAbstract'));
    expect(matchState, contains('isStatic'));

    print(matchState);
  });
}
