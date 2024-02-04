# BLoC Architecture Flutter

## [1. BaseBloc](./lib/core/base/bloc/base_bloc.dart)

Base config bloc for app

- Support runBlocCatching for excute function safe
- Support status for page

## [2. BasePageState](./lib/core/base/base_page_state.dart)

Base config for StatefulWidget

## [3. AppPagingController](./lib/core/base/pagination/app_paging_controller.dart)

A controller for a paged widget.
If you modify the itemList, error or nextPageKey properties, the paged widget will be notified and will update itself appropriately.

# Code Generator

In Flutter, code generation is used for a variety of purposes, such as generating code for working with JSON data, generating code for working with databases, and generating code for working with web services. Code generation can make it easier to write and maintain code, as it can automate repetitive tasks and reduce the amount of manual coding that is required.

## [1. Freezed](https://pub.dev/packages/freezed)

Code generation for immutable classes that has a simple syntax/API without compromising on the features.

## [2. Json_serializable](https://pub.dev/packages/json_serializable)

Automatically generate code for converting to and from JSON by annotating Dart classes.

## [3. Flutter_gen](https://pub.dev/packages/flutter_gen)

The Flutter code generator for your assets, fonts, colors, … — Get rid of all String-based APIs.

## [4. Hive_generator](https://pub.dev/packages/hive_generator)

Extension for Hive. Automatically generates TypeAdapters to store any class.

## [5. injectable_generator](https://pub.dev/packages/injectable_generator)

Injectable is a convenient code generator for get_it. Inspired by Angular DI, Guice DI and inject.dart.

## [6. retrofit_generator](https://pub.dev/packages/retrofit_generator)

Generator is an dio client generator using source_gen and inspired by Chopper and Retrofit.

## [7. go_router_builder](https://pub.dev/packages/go_router_builder)

A builder that supports generated strongly-typed route helpers for package:go_router
