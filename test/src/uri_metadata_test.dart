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

final Metadata _defaultUriMetadata = new UriReferencedMetadata(prefix: '', shownNames: <String>[], hiddenNames: <String>[]);
final Metadata _prefixedUriMetadata = new UriReferencedMetadata(prefix: 'f', shownNames: <String>[], hiddenNames: <String>[]);
final Metadata _showUriMetadata = new UriReferencedMetadata(prefix: '', shownNames: <String>['F'], hiddenNames: <String>[]);
final Metadata _hideUriMetadata = new UriReferencedMetadata(prefix: '', shownNames: <String>[], hiddenNames: <String>['F']);
final Metadata _notUriMetadataType = new ClassMetadata('C');

void main() {
  test('isUriReferencedMetadata', () {
    final matcher = isUriReferencedMetadata;

    expectMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectMatch(matcher, _showUriMetadata);
    expectMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);
  });
  test('notPrefixed', () {
    final matcher = notPrefixed;

    expectMatch(matcher, _defaultUriMetadata);
    expectNoMatch(matcher, _prefixedUriMetadata);
    expectMatch(matcher, _showUriMetadata);
    expectMatch(matcher, _hideUriMetadata);
    expectMatch(matcher, _notUriMetadataType);
  });
  test('isPrefixed', () {
    final matcher = isPrefixed;

    expectNoMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectNoMatch(matcher, _showUriMetadata);
    expectNoMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);
  });
  test('prefixedBy', () {
    final matcher = prefixedBy('f');

    expectNoMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectNoMatch(matcher, _showUriMetadata);
    expectNoMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);

    expectNoMatch(prefixedBy('b'), _prefixedUriMetadata);
  });
  test('isPrefixed', () {
    final matcher = isPrefixed;

    expectNoMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectNoMatch(matcher, _showUriMetadata);
    expectNoMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);
  });
  test('showsAllNames', () {
    final matcher = showsAllNames;

    expectMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectNoMatch(matcher, _showUriMetadata);
    expectMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);
  });
  test('isPrefixed', () {
    final matcher = isPrefixed;

    expectNoMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectNoMatch(matcher, _showUriMetadata);
    expectNoMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);
  });
  test('isPrefixed', () {
    final matcher = isPrefixed;

    expectNoMatch(matcher, _defaultUriMetadata);
    expectMatch(matcher, _prefixedUriMetadata);
    expectNoMatch(matcher, _showUriMetadata);
    expectNoMatch(matcher, _hideUriMetadata);
    expectNoMatch(matcher, _notUriMetadataType);
  });
}
