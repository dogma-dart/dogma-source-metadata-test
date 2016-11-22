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
import 'src/annotated_test.dart' as annotated_test;
import 'src/class_metadata_matcher_test.dart' as class_metadata_matcher_test;
import 'src/commented_test.dart' as commented_test;
import 'src/constant_metadata_test.dart' as constant_metadata_test;
import 'src/constructor_metadata_matcher_test.dart' as constructor_metadata_matcher_test;
import 'src/deprecated_annotation_test.dart' as deprecated_annotation_test;
import 'src/field_metadata_matcher_test.dart' as field_metadata_matcher_test;
import 'src/function_metadata_matcher_test.dart' as function_metadata_matcher_test;
import 'src/method_metadata_matcher_test.dart' as method_metadata_matcher_test;
import 'src/override_annotation_test.dart' as override_annotation_test;
import 'src/parameter_metadata_matcher_test.dart' as parameter_metadata_matcher_test;
import 'src/parameter_metadata_test.dart' as parameter_metadata_test;
import 'src/privacy_metadata_test.dart' as privacy_metadata_test;
import 'src/protected_annotation_test.dart' as protected_annotation_test;
import 'src/static_metadata_test.dart' as static_metadata_test;
import 'src/typed_metadata_test.dart' as typed_metadata_test;
import 'src/typedef_metadata_matcher_test.dart' as typedef_metadata_matcher_test;
import 'src/typedef_metadata_test.dart' as typedef_metadata_test;

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Entry point for tests.
void main() {
  // Run tests
  group('AbstractMetadata tests', abstract_metadata_test.main);
  group('Commented tests', commented_test.main);
  group('ConstantMetadata tests', constant_metadata_test.main);
  group('ParameterMetadata tests', parameter_metadata_test.main);
  group('PrivacyMetadata tests', privacy_metadata_test.main);
  group('StaticMetadata tests', static_metadata_test.main);
  group('TypedMetadata tests', typed_metadata_test.main);
  group('TypedefMetadata tests', typedef_metadata_test.main);

  group('Annotated tests', annotated_test.main);
  group('@deprecated annotation tests', deprecated_annotation_test.main);
  group('@override annotation tests', override_annotation_test.main);
  group('@protected annotation tests', protected_annotation_test.main);

  group('ClassMetadataMatcher tests', class_metadata_matcher_test.main);
  group('ConstructorMetadataMatcher tests', constructor_metadata_matcher_test.main);
  group('FieldMetadataMatcher tests', field_metadata_matcher_test.main);
  group('FunctionMetadataMatcher tests', function_metadata_matcher_test.main);
  group('MethodMetadataMatcher tests', method_metadata_matcher_test.main);
  group('ParameterMetadataMatcher tests', parameter_metadata_matcher_test.main);
  group('TypedefMetadataMatcher tests', typedef_metadata_matcher_test.main);
}
