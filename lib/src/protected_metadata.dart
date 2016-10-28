// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'annotated.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Matcher for checking if metadata is protected.
final Matcher isProtected = annotatedWith(protected, 'metadata is protected');

/// Matcher for checking if metadata is not protected.
final Matcher isNotProtected = notAnnotatedWith(
    protected,
    'metadata is not protected'
);
