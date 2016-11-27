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
    final actual = new MethodMetadata(
        'foo',
        parameters: <ParameterMetadata>[
          new ParameterMetadata('a'),
          new ParameterMetadata('b'),
        ],
        typeParameters: <TypeMetadata>[
          dynamicType
        ]
    );
    final expected = new MethodMetadata(
        'foo',
        parameters: <ParameterMetadata>[
          new ParameterMetadata('a'),
          new ParameterMetadata('b'),
        ],
        typeParameters: <TypeMetadata>[
          dynamicType
        ]
    );

    expect(actual, metadataEqual(expected));
  });
  test('adding differences', () {
    final actual = new MethodMetadata(
        'foo',
        returnType: intType,
        parameters: <ParameterMetadata>[
          new ParameterMetadata('a'),
          new ParameterMetadata('b')
        ],
        typeParameters: <TypeMetadata>[
          dynamicType
        ],
        isAbstract: true,
        isStatic: false
    );
    final expected = new MethodMetadata(
        'bar',
        returnType: boolType,
        parameters: <ParameterMetadata>[
          new ParameterMetadata('c')
        ],
        typeParameters: <TypeMetadata>[
          intType,
          dynamicType
        ],
        isAbstract: false,
        isStatic: true
    );

    final matcher = metadataEqual(expected);
    final matchState = {};
    matcher.matches(actual, matchState);

    expect(matchState, hasLength(6));

    // Expect field names
    expect(matchState, contains('name'));
    expect(matchState, contains('returnType'));
    expect(matchState, contains('parameters'));
    expect(matchState, contains('typeParameters'));
    expect(matchState, contains('isAbstract'));
    expect(matchState, contains('isStatic'));
  });
}
