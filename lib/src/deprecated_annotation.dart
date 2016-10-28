// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

import 'annotated.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Matcher for checking if metadata is deprecated.
final Matcher isDeprecated = annotatedWith(
    deprecated,
    'metadata is deprecated'
);

/// Matcher for checking if metadata is not deprecated.
final Matcher isNotDeprecated = notAnnotatedWith(
    deprecated,
    'metadata is not deprecated'
);
