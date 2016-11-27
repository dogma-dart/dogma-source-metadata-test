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

/// A matcher for [ClassMetadata] instances.
const Matcher isClassMetadata = const isInstanceOf<ClassMetadata>();

final Matcher hasNoMethods =
    predicate((value) {
      if (value is! ClassMetadata) return true;

      return (value as ClassMetadata).methods.isEmpty;
    });

Matcher hasMethods(int count) =>
    predicate((value) {
      if (value is! ClassMetadata) return false;

      return (value as ClassMetadata).methods.length == count;
    });
