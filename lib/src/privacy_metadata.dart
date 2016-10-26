// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A matcher for [PrivacyMetadata] instances.
const Matcher isPrivacyMetadata = const isInstanceOf<PrivacyMetadata>();

/// A matcher for private metadata.
final Matcher isPrivate = predicate((value) {
  if (value is! PrivacyMetadata) return false;

  return (value as PrivacyMetadata).isPrivate;
}, 'metadata is private');

/// A matcher for public metadata.
final Matcher isPublic = predicate((value) {
  if (value is! PrivacyMetadata) return true;

  return (value as PrivacyMetadata).isPublic;
}, 'metadata is public');
