// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A matcher for [LibraryMetadata] instances.
const Matcher isLibraryMetadata = const isInstanceOf<LibraryMetadata>();

final Matcher hasNoClasses =
    predicate((value) {
      if (value is! LibraryMetadata) return true;

      return (value as LibraryMetadata).classes.isEmpty;
    });

Matcher hasClasses(int count) =>
    predicate((value) {
      if (value is! LibraryMetadata) return false;

      return (value as LibraryMetadata).classes.length == count;
    });

final Matcher hasNoFunctions =
    predicate((value) {
      if (value is! LibraryMetadata) return true;

      return (value as LibraryMetadata).functions.isEmpty;
    });

Matcher hasFunctions(int count) =>
    predicate((value) {
      if (value is! LibraryMetadata) return false;

      return (value as LibraryMetadata).functions.length == count;
    });

final Matcher hasNoTypedefs =
    predicate((value) {
      if (value is! LibraryMetadata) return true;

      return (value as LibraryMetadata).typedefs.isEmpty;
    });

Matcher hasTypedefs(int count) =>
    predicate((value) {
      if (value is! LibraryMetadata) return false;

      return (value as LibraryMetadata).typedefs.length == count;
    });

Matcher imports(Uri uri) =>
    predicate((value) {
      if (value is! LibraryMetadata) return false;

      return _references(value.imports, uri);
    });

Matcher exports(Uri uri) =>
    predicate((value) {
      if (value is! LibraryMetadata) return false;

      return _references(value.exports, uri);
    });

bool _references(Iterable<UriReferencedMetadata> references, Uri uri) =>
    references.firstWhere((value) {
      final library = value.library;

      if (library == null) return false;

      return value.library == uri;
    }, orElse: () => null) == null;
