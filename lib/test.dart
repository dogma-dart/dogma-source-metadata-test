// Copyright (c) 2015-2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// The `dogma_source_metadata_test.test` library is used when testing the
/// correctness of metadata. It provides functionality that makes it easier to
/// check validity when using metadata through the `test` library.
///
/// # Testing Metadata values
///
/// When testing individual instances of metadata the test library provides a
/// number of helpers that make the values on the fields easier and make the
/// test code more readable. For the most part they are just simple functions
/// the wrap different field checks provided as matchers which can be passed
/// to the expect function within test.
///
///     final actual = new ParameterMetadata(
///         'foo',
///         parameterKind: ParameterKind.named
///     );
///
///     // Passes check
///     expect(actual, isNamedParameter);
///     // Fails check
///     expect(actual, isRequiredParameter);
///
/// Helpers are provided for each of the different metadata types. View the
/// documentation for a full listing of what is available.
///
/// # Testing Metadata equality
///
/// Outside of TypeMetadata none of the classes in
/// `dogma_source_metadata.metadata` contain any equality operators. This is
/// done by design as the annotations on metadata cannot be checked. The test
/// library however contains matchers that can check for equality.
///
/// The matchers cannot be instantiated directly, instead they are created by
/// calling the [metadataEqual] function. This will return a matcher that can
/// then be used in conjunction with expect within the test framework.
///
///     final expected = new FunctionMetadata('foo');
///
///     expect(actual, metadataEqual(expected));
///
/// The matchers will end up looking at all fields of the instances and compare
/// their values minus the annotations. When comparing lists of values the
/// matchers will take into account the ordering or ignore it dependent on the
/// context.
///
/// With function parameters the order is important and will be checked.
///
///     final expected = new FunctionMetadata(
///         new ParameterMetadata('foo'),
///         new ParameterMetadata('bar')
///     );
///     final actual = new FunctionMetadata(
///         new ParameterMetadata('bar'),
///         new ParameterMetadata('foo')
///     );
///
///     // Fails check because of ordering of parameters
///     expect(actual, metadataEqual(expected));
///
/// With the list of classes being implemented the order has no bearing on
/// equality.
///
///     final expected = new ClassMetadata(
///         'FooBar',
///         implements: [new TypeMetadata('Foo'), new TypeMetadata('Bar')]
///     );
///     final actual = new ClassMetadata(
///         'FooBar',
///         implements: [new TypeMetadata('Bar'), new TypeMetadata('Foo')]
///     );
///
///     // Passes check because order doesn't matter for implements
///     expect(actual, metadataEqual(expected));
///
/// View the documentation for the individual matcher implementations to see if
/// the ordering of their values are taken into account.
///
/// # Testing for annotations
///
/// Annotations cannot be automatically tested for. When writing tests they
/// need to be explicitly verified. How to test for them is dependent on what
/// the annotation looks like.
///
/// ## Using equality
///
/// Annotation classes that have an equality operator can be tested for using
/// [annotatedWith].
///
///     final actual = new ClassMetadata(
///         'Foo',
///         annotations: [new MyAnnotation('mine')]
///     );
///
///     // Passes check because the metadata is equal
///     expect(actual, annotatedWith(new MyAnnotation('mine'));
///
/// Also annotations that are the same instance can be compared directly with
/// [annotatedWith]. Annotations such as `@override` and `@deprecated` fit
/// this criteria.
///
///     class _MyAnnotation {
///       const _MyAnnotation();
///     }
///     const _MyAnnotation myAnnotation;
///
///     final actual = new ClassMetadata(
///         'Foo',
///         annotations: [myAnnotation]
///     );
///
///     // Pass checks because the metadata is the same instance
///     expect(actual, annotatedWith(myAnnotation));
///
/// When instantiating annotations through the analyzer that use this pattern
/// the [annotatedWith] function can also be used. This is because the
/// annotation will be found by using `dart:mirrors` library which will have
/// the actual instance and not a copy.
///
/// ## Explicitly checking
///
/// If the annotation does not contain an equality operator then the
/// [hasAnnotation] function can be used to create a matcher. It takes an
/// [AnnotationEqual] function which takes an actual and expected value.
///
///     class MyAnnotation {
///       final String value;
///       const MyAnnotation(this.value);
///     }
///
///     bool myAnnotationEqual(dynamic actual, MyAnnotation expected) {
///       if (actual is! MyAnnotation) return false;
///     }
///
///     final actual = new ClassMetadata(
///       'Foo',
///       annotations: [new MyAnnotation('mine')]
///     );
///     final matcher = annotatedWith(myAnnotationEqual, new MyAnnotation('mine'));
///
///     // Passes check because the metadata is equal
///     expect(actual, matcher);
///
/// When using the [hasAnnotation] function the check should always check the
/// type of the annotation before doing any testing.
library dogma_source_metadata_test.test;

//---------------------------------------------------------------------
// Documentation imports
//---------------------------------------------------------------------

import 'src/metadata.dart';
import 'src/annotated.dart';

//---------------------------------------------------------------------
// Exports
//---------------------------------------------------------------------

export 'src/abstract_metadata.dart';
export 'src/annotated.dart';
export 'src/class_metadata.dart';
export 'src/commented.dart';
export 'src/constant_metadata.dart';
export 'src/constructor_metadata.dart';
export 'src/deprecated_annotation.dart';
export 'src/field_metadata.dart';
export 'src/function_metadata.dart';
export 'src/library_metadata.dart';
export 'src/metadata.dart';
export 'src/method_metadata.dart';
export 'src/override_annotation.dart';
export 'src/parameter_metadata.dart';
export 'src/privacy_metadata.dart';
export 'src/protected_metadata.dart';
export 'src/static_metadata.dart';
export 'src/typed_metadata.dart';
export 'src/uri_referenced_metadata.dart';
