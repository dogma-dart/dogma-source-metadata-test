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
const _IsPrivate isPrivate = const _IsPrivate();

/// A matcher for public metadata.
const _IsPublic isPublic = const _IsPublic();

class _IsPrivate extends Matcher {
  const _IsPrivate();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! PrivacyMetadata) return false;

    return (item as PrivacyMetadata).isPrivate;
  }

  @override
  Description describe(Description description) => description.add('metadata is private');
}

class _IsPublic extends Matcher {
  const _IsPublic();

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is! PrivacyMetadata) return true;

    return (item as PrivacyMetadata).isPublic;
  }

  @override
  Description describe(Description description) => description.add('metadata is public');
}
