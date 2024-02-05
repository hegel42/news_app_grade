// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

// class DioErrorHandler {
//   DioErrorHandler({
//     required this.token,
//     required this.onAnalyticsCallback,
//   });

//   final String token;
//   final Function(String screenName, Map<String, dynamic>? data) onAnalyticsCallback;

//   bool get hasToken => token.isNotEmpty;

//   DioError? handleError(DioError dioError) {
//     Logger.d('DIO_ERROR:',
//         'RESPONSE: ${dioError.response}\n MESSAGE: ${dioError.message}\n ERROR: ${dioError.error} \n STATUS_CODE: ${dioError.response?.statusCode}');
//     if (dioError.response == null || dioError.message.contains('SocketException:')) {
//       return DioError(
//         requestOptions: dioError.requestOptions,
//         // error: locale.noConnectionError,
//         response: Response(
//           statusCode: 400,
//           requestOptions: dioError.requestOptions,
//         ),
//       );
//     }

//     if (dioError.response?.statusCode == 401 && hasToken) {
//       if (!kDebugMode) {
//         onAnalyticsCallback.call('UnauthorizedUser', {'token': token});
//       }
//       return DioError(
//         requestOptions: dioError.requestOptions,
//         // error: locale.sessionClosedNeedAuth,
//         response: Response(
//           statusCode: 401,
//           requestOptions: dioError.requestOptions,
//         ),
//       );
//     }

//     try {
//       Map<String, dynamic> parsedError = json.decode(dioError.response.toString());
//       if (parsedError.containsKey('errors')) {
//         Map<String, dynamic> errors = parsedError['errors'];
//         String errorsString = '';
//         errors.forEach((key, value) {
//           (value as List).forEach((element) {
//             errorsString += '• ' + element + '\n';
//           });
//         });
//         return DioError(
//           requestOptions: dioError.requestOptions,
//           error: errorsString.isNotEmpty ? errorsString : '',
//           response: Response(
//             statusCode: dioError.response?.statusCode,
//             requestOptions: dioError.requestOptions,
//           ),
//         );
//       }

//       if (parsedError.containsKey('message') && dioError.response?.statusCode != 451) {
//         return DioError(
//             requestOptions: dioError.requestOptions,
//             error: parsedError['message'],
//             response: Response(
//               statusCode: dioError.response?.statusCode,
//               requestOptions: dioError.requestOptions,
//             ));
//       }
//     } catch (exception) {
//       print(
//           'ERROR_PARSE_EXCEPTION: PATH: ${dioError.requestOptions.path}/ RESPONSE: ${dioError.response.toString()}/ $exception');
//     }
//     if (dioError.response?.statusCode == 503) {
//       return DioError(
//           requestOptions: dioError.requestOptions,
//           // error: locale.somethingWentWrong,
//           response: Response(
//             statusCode: dioError.response?.statusCode,
//             requestOptions: dioError.requestOptions,
//           ));
//     }
//     return null;
//   }

//   DioError handleNoContent(Response response) {
//     return DioError(
//       requestOptions: response.requestOptions,
//       // error: locale.somethingWentWrong,
//       response: Response(
//         statusCode: 204,
//         requestOptions: response.requestOptions,
//       ),
//     );
//   }
// }
