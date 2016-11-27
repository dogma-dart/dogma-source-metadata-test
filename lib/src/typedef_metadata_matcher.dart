// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';

import 'function_metadata_matcher.dart';
import 'metadata_matcher.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A [MetadataMatcher] for [MethodMetadata] equality.
class TypedefMetadataMatcher extends FunctionMetadataMatcher<TypedefMetadata> {
  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Creates an instance of [TypedefMetadataMatcher] which compares metadata
  /// using the values in [expected].
  TypedefMetadataMatcher(TypedefMetadata expected)
      : super(expected);
}
