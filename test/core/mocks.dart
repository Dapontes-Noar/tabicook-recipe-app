import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';

import 'mocks.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>(), MockSpec<Interceptor>()])
final mockDio = MockDio();
final mockInterceptor = MockInterceptor();

class FakeBuildContext extends Fake implements BuildContext {}
