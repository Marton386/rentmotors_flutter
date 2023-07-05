import 'dart:io';
import '../../utils/result.dart';
import '../models/responses/cancel/data_cancel.dart';
import '../models/responses/dadata/data_dadata.dart';
import '../models/responses/modify/data_modify.dart';
import '../models/responses/app_versions/app_versions.dart';
import '../models/responses/cancel_pay/data_cancel_pay.dart';
import '../models/requests/org_request/data_org_request.dart';
import '../models/responses/client_info/data_client_info.dart';
import '../models/responses/check_pay_link/data_check_pay_link.dart';
import 'package:rentmotors/data/models/responses/book/data_book.dart';
import '../models/requests/booking_request/data_booking_request.dart';
import '../models/responses/get_pay_response/data_get_pay_response.dart';
import 'package:rentmotors/data/models/responses/station/data_station.dart';
import '../models/requests/modify_book_request/data_modify_book_request.dart';
import '../models/requests/booking_org_request/data_booking_org_request.dart';
import '../models/responses/search_car_response/data_search_car_response.dart';
import '../models/responses/reservation_response/data_reservation_response.dart';

abstract class NetworkStorage {
  //book api
  Future<Result<DataBook>> book(DataBookingRequest bookingRequest);
  Future<Result<DataBook>> orgBook(DataBookingOrgRequest bookingOrgRequest);

  //car API
  Future<Result<DataSearchCarResponse>> getCars(
    int stationPickUp,
    int stationDropOff,
    String datePickUp,
    String dateDropOff,
  );

  //check client API
  Future<Result<DataClientInfo>> checkClient(String lastName, String email);

  //check app version
  Future<Result<DataAppVersions>> checkAppVer();

  //org API
  Future<Result<DataDadata>> getOrg(DataOrgRequest orgRequest);

  //payment API
  Future<Result<DataCheckPayLink>> checkPayLink(String reservationID, String email);
  Future<Result<DataGetPayResponse>> getPayLink(String reservationID, String email);
  Future<Result<DataCancelPay>> cancelOnlineLink(String reservationID);

  //res API
  // ignore: non_constant_identifier_names
  Future<Result<DataReservationResponse>> getReservation(String res_id, String email);
  // ignore: non_constant_identifier_names
  Future<Result<DataCancel>> getCancel(String res_id, String email);
  Future<Result<DataModify>> updateRes(DataModifyBookRequest modifyBookRequest);

  //station API
  Future<Result<List<DataStation>>> getStations();

  //voucher API
  Future<Result<File>> loadVoucher(String numReservation, String email);
  Future<Result<File>> loadPdfVoucher(String numReservation, String email);
}
