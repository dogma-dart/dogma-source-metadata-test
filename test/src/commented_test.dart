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

const String _comments = 'Heres comments!';
final Metadata _commentedMetadata = new FieldMetadata('c', comments: _comments);
final Metadata _uncommentedMetadata = new ParameterMetadata('p');
final Metadata _notCommentedMetadata = stringType;

void main() {
  test('uncommented', () {
    final matcher = uncommented;

    expectNoMatch(matcher, _commentedMetadata);
    expectMatch(matcher, _uncommentedMetadata);
    expectMatch(matcher, _notCommentedMetadata);
  });
  test('commented', () {
    final matcher = commented;

    expectMatch(matcher, _commentedMetadata);
    expectNoMatch(matcher, _uncommentedMetadata);
    expectNoMatch(matcher, _notCommentedMetadata);
  });
  test('commentedWith', () {
    final matcher = commentedWith(_comments);

    expectMatch(matcher, _commentedMetadata);
    expectNoMatch(matcher, _uncommentedMetadata);
    expectNoMatch(matcher, _notCommentedMetadata);
  });
}
