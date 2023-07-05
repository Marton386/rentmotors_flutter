import 'dart:io';
import 'dart:convert';
import 'network_storage.dart';
import '../../utils/result.dart';
import 'package:get_it/get_it.dart';
import '../../utils/header_helper.dart';
import 'package:http/http.dart' as http;
import '../../res/generated/locale_keys.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rentmotors/utils/error_codes.dart';
import 'package:easy_localization/easy_localization.dart';
import '../models/responses/app_versions/app_versions.dart';
import 'package:rentmotors/data/models/responses/book/data_book.dart';
import 'package:rentmotors/data/models/responses/modify/data_modify.dart';
import 'package:rentmotors/data/models/responses/cancel/data_cancel.dart';
import 'package:rentmotors/data/models/responses/dadata/data_dadata.dart';
import 'package:rentmotors/data/models/responses/station/data_station.dart';
import 'package:rentmotors/data/models/responses/cancel_pay/data_cancel_pay.dart';
import 'package:rentmotors/data/models/requests/org_request/data_org_request.dart';
import 'package:rentmotors/data/models/responses/client_info/data_client_info.dart';
import 'package:rentmotors/data/models/responses/check_pay_link/data_check_pay_link.dart';
import 'package:rentmotors/data/models/requests/booking_request/data_booking_request.dart';
import 'package:rentmotors/data/models/responses/get_pay_response/data_get_pay_response.dart';
import 'package:rentmotors/data/models/requests/modify_book_request/data_modify_book_request.dart';
import 'package:rentmotors/data/models/requests/booking_org_request/data_booking_org_request.dart';
import 'package:rentmotors/data/models/responses/search_car_response/data_search_car_response.dart';
import 'package:rentmotors/data/models/responses/reservation_response/data_reservation_response.dart';

class NetworkStorageImpl implements NetworkStorage {
  final baseURL = "https://api.onlinefleet.ru";
  final baseURLWithoutHTTP = "api.onlinefleet.ru";
  final orgURL = "suggestions.dadata.ru";
  final rmURL = "https://rentmotors.ru";
  var headerHelper = GetIt.instance<HeaderHelper>();
  var errCodes = ErrorCodes();

  //book api
  @override
  Future<Result<DataBook>> book(DataBookingRequest bookingRequest) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/1.0/book/'),
        headers: headerHelper.getRmPostHeader(),
        body: jsonEncode(bookingRequest.toJson()),
      );
      var jsonResult = json.decode(response.body);
      DataBook data = DataBook.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  @override
  Future<Result<DataBook>> orgBook(
      DataBookingOrgRequest bookingOrgRequest) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/1.0/book/'),
        headers: headerHelper.getRmPostHeader(),
        body: jsonEncode(bookingOrgRequest.toJson()),
      );
      var jsonResult = json.decode(response.body);
      DataBook data = DataBook.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //car API
  @override
  Future<Result<DataSearchCarResponse>> getCars(int stationPickUp,
      int stationDropOff, String datePickUp, String dateDropOff) async {
    try {
      Map<String, dynamic> queryParameters = {
        "p_station": stationPickUp.toString(),
        "d_station": stationDropOff.toString(),
        "p_date": datePickUp,
        "d_date": dateDropOff,
        "age": 30.toString(),
      };
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/search', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataSearchCarResponse data = DataSearchCarResponse.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //check app version
  @override
  Future<Result<DataAppVersions>> checkAppVer() async {
    try {
      var response = await http.get(
        Uri.parse('$rmURL/apps_config.json'),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataAppVersions data = DataAppVersions.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //check client API
  @override
  Future<Result<DataClientInfo>> checkClient(
      String lastName, String email) async {
    try {
      Map<String, dynamic> queryParameters = {
        "last_name": lastName,
        "email": email
      };
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/regular_customer_detect', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataClientInfo data = DataClientInfo.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //org API
  @override
  Future<Result<DataDadata>> getOrg(DataOrgRequest orgRequest) async {
    try {
      Map<String, dynamic> queryParameters = {
        "token": HeaderHelper.orgToken,
      };
      var response = await http.post(
        Uri.https(
            orgURL, '/suggestions/api/4_1/rs/suggest/party', queryParameters),
        headers: headerHelper.getOrgPostHeader(),
        body: jsonEncode(orgRequest.toJson()),
      );
      var jsonResult = json.decode(response.body);
      DataDadata data = DataDadata.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //payment API
  @override
  Future<Result<DataCheckPayLink>> checkPayLink(
      String reservationID, String email) async {
    try {
      Map<String, dynamic> queryParameters = {
        "res_id": reservationID,
        "email": email
      };
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/generate_online_payment', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataCheckPayLink data = DataCheckPayLink.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  @override
  Future<Result<DataGetPayResponse>> getPayLink(
      String reservationID, String email) async {
    try {
      Map<String, dynamic> queryParameters = {
        "res_id": reservationID,
        "email": email
      };
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/generate_online_payment', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataGetPayResponse data = DataGetPayResponse.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  @override
  Future<Result<DataCancelPay>> cancelOnlineLink(String reservationID) async {
    try {
      Map<String, dynamic> queryParameters = {"res_id": reservationID};
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/cancel_online_payment', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataCancelPay data = DataCancelPay.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //res API
  @override
  Future<Result<DataReservationResponse>> getReservation(
      // ignore: non_constant_identifier_names
      String res_id,
      String email) async {
    try {
      Map<String, dynamic> queryParameters = {"res_id": res_id, "email": email};
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/detail', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataReservationResponse data =
          DataReservationResponse.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(LocaleKeys.your_res_no_found.tr()));
    }
  }

  @override
  // ignore: non_constant_identifier_names
  Future<Result<DataCancel>> getCancel(String res_id, String email) async {
    try {
      Map<String, dynamic> queryParameters = {"res_id": res_id, "email": email};
      var response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/cancel_book', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      var jsonResult = json.decode(response.body);
      DataCancel data = DataCancel.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  @override
  Future<Result<DataModify>> updateRes(
      DataModifyBookRequest modifyBookRequest) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/1.0/modify/'),
        headers: headerHelper.getRmPostHeader(),
        body: jsonEncode(modifyBookRequest.toJson()),
      );
      var jsonResult = json.decode(response.body);
      DataModify data = DataModify.fromJson(jsonResult);
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //station API
  @override
  Future<Result<List<DataStation>>> getStations() async {
    try {
      var response = await http.get(
        Uri.parse('$baseURL/1.0/station/'),
        headers: headerHelper.getRmGetHeader(),
      );
      Iterable jsonResult = json.decode(response.body);
      List<DataStation> data = jsonResult
          .map((model) => DataStation.fromJson(model))
          .toList();
      return Success(data);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Future.value(
          Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE)));
    } catch (e) {
      return Future.value(Error(errCodes.getMessageByCode(errCodes.FAILURE)));
    }
  }

  //voucher API
  @override
  Future<Result<File>> loadVoucher(String numReservation, String email) async {
    try {
      Map<String, dynamic> queryParameters = {
        "res_id": numReservation,
        "email": email
      };
      final response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/wallet_pass', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      final cacheDirectory =
          await getTemporaryDirectory(); //getApplicationDocumentsDirectory();
      final fileName = "Book $numReservation.pkpass";
      final voucherFile = File('${cacheDirectory.path}/$fileName');
      final bytes = response.bodyBytes;
      await voucherFile.writeAsBytes(bytes);
      return Success(voucherFile);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE));
    } catch (e) {
      return Error(errCodes.getMessageByCode(errCodes.FAILURE));
    }
  }

  @override
  Future<Result<File>> loadPdfVoucher(
      String numReservation, String email) async {
    try {
      Map<String, dynamic> queryParameters = {
        "res_id": numReservation,
        "email": email,
        "type": "PDF"
      };
      final response = await http.get(
        Uri.https(baseURLWithoutHTTP, '/1.0/get_book_confirmation', queryParameters),
        headers: headerHelper.getRmGetHeader(),
      );
      final cacheDirectory =
          await getTemporaryDirectory(); //getApplicationDocumentsDirectory();
      final fileName = "Book $numReservation.pdf";
      final voucherFile = File('${cacheDirectory.path}/$fileName');
      final bytes = response.bodyBytes;
      await voucherFile.writeAsBytes(bytes);
      return Success(voucherFile);
    } on HttpException catch (e) {
      return Future.value(Error(e.message));
    } on SocketException {
      return Error(errCodes.getMessageByCode(errCodes.REQUEST_FAILURE));
    } catch (e) {
      return Error(errCodes.getMessageByCode(errCodes.FAILURE));
    }
  }
}