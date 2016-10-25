// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

// \TODO Remove this file after https://github.com/dart-lang/test/issues/36 is resolved.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:test/test.dart';

import 'src/abstract_metadata_test.dart' as abstract_metadata_test;
import 'src/constant_metadata_test.dart' as constant_metadata_test;
import 'src/privacy_metadata_test.dart' as privacy_metadata_test;
import 'src/static_metadata_test.dart' as static_metadata_test;
import 'src/typed_metadata_test.dart' as typed_metadata_test;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Entry point for tests.
void main() {
  // Run tests
  group('AbstractMetadata tests', abstract_metadata_test.main);
  group('ConstantMetadata tests', constant_metadata_test.main);
  group('PrivacyMetadata tests', privacy_metadata_test.main);
  group('StaticMetadata tests', static_metadata_test.main);
  group('TypedMetadata tests', typed_metadata_test.main);
}
