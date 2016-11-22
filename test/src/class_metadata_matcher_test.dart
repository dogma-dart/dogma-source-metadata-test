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
    // Unordered values are checked by changing the ordering
    final actual = new ClassMetadata(
        'Foo',
        interfaces: <TypeMetadata>[
          interfaceType('A'),
          interfaceType('B'),
        ],
        mixins: <TypeMetadata>[
          interfaceType('M'),
          interfaceType('N')
        ],
        typeParameters: <TypeMetadata>[
          dynamicType
        ],
        methods: <MethodMetadata>[
          new MethodMetadata('mA'),
          new MethodMetadata('mB')
        ],
        fields: <FieldMetadata>[
          new FieldMetadata('fA'),
          new FieldMetadata('fB')
        ],
        constructors: <ConstructorMetadata>[
          new ConstructorMetadata(interfaceType('Foo', [dynamicType])),
          new ConstructorMetadata(interfaceType('Foo', [dynamicType]), name: 'named')
        ]
    );
    final expected = new ClassMetadata(
        'Foo',
        interfaces: <TypeMetadata>[
          interfaceType('B'),
          interfaceType('A'),
        ],
        mixins: <TypeMetadata>[
          interfaceType('N'),
          interfaceType('M')
        ],
        typeParameters: <TypeMetadata>[
          dynamicType
        ],
        methods: <MethodMetadata>[
          new MethodMetadata('mB'),
          new MethodMetadata('mA')
        ],
        fields: <FieldMetadata>[
          new FieldMetadata('fB'),
          new FieldMetadata('fA')
        ],
        constructors: <ConstructorMetadata>[
          new ConstructorMetadata(interfaceType('Foo', [dynamicType])),
          new ConstructorMetadata(interfaceType('Foo', [dynamicType]), name: 'named')
        ]
    );

    expect(actual, metadataEqual(expected));
  });
  test('adding differences', () {
    final actual = new ClassMetadata(
        'Foo',
        supertype: interfaceType('F'),
        isAbstract: false,
        interfaces: <TypeMetadata>[
          interfaceType('A'),
          interfaceType('B'),
        ],
        mixins: <TypeMetadata>[
          interfaceType('M'),
          interfaceType('N')
        ],
        typeParameters: <TypeMetadata>[
          dynamicType
        ],
        fields: <FieldMetadata>[
          new FieldMetadata('fA'),
          new FieldMetadata('fB')
        ],
        methods: <MethodMetadata>[
          new MethodMetadata('mA'),
          new MethodMetadata('mB')
        ],
        constructors: <ConstructorMetadata>[
          new ConstructorMetadata(interfaceType('Foo', [dynamicType])),
          new ConstructorMetadata(interfaceType('Foo', [dynamicType]), name: 'named')
        ]
    );
    final expected = new ClassMetadata(
        'Bar',
        supertype: interfaceType('B'),
        isAbstract: true,
        interfaces: <TypeMetadata>[
          interfaceType('W'),
          interfaceType('X'),
        ],
        mixins: <TypeMetadata>[
          interfaceType('Y'),
          interfaceType('Z')
        ],
        typeParameters: <TypeMetadata>[
          intType
        ],
        fields: <FieldMetadata>[
          new FieldMetadata('fY'),
          new FieldMetadata('fZ')
        ],
        methods: <MethodMetadata>[
          new MethodMetadata('mY'),
          new MethodMetadata('mZ')
        ],
        constructors: <ConstructorMetadata>[
          new ConstructorMetadata(interfaceType('Bar', [dynamicType])),
          new ConstructorMetadata(interfaceType('Bar', [dynamicType]), name: 'named')
        ],
    );

    final matcher = metadataEqual(expected);
    final matchState = {};
    matcher.matches(actual, matchState);

    expect(matchState, hasLength(9));

    // Expect field names
    expect(matchState, contains('name'));
    expect(matchState, contains('supertype'));
    expect(matchState, contains('isAbstract'));
    expect(matchState, contains('interfaces'));
    expect(matchState, contains('mixins'));
    expect(matchState, contains('typeParameters'));
    expect(matchState, contains('fields'));
    expect(matchState, contains('methods'));
    expect(matchState, contains('constructors'));
  });
}
