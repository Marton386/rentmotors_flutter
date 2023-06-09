import '../../../utils/result.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../interactors/book_interactor.dart';
import '../../viewModels/booking_view_model.dart';
import '../../models/responses/presentation_book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/responses/presentation_client_info.dart';
import '../../models/requests/presentation_booking_request.dart';
import '../../models/requests/presentation_booking_org_request.dart';

part 'regular_booking_bloc.freezed.dart';
part 'regular_booking_event.dart';
part 'regular_booking_state.dart';

class RegularBookingBloc extends Bloc<RegularBookingEvent, RegularBookingState>{
  final BookingViewModel bookViewModel = GetIt
      .instance<BookingViewModel>();
  final BookInteractor bookInteractor = GetIt.instance<BookInteractor>();

  RegularBookingBloc() : super(const RegularBookingState.loaded()) {
    on<RegularBookingEventFetch>((event, emit) async {
      emit(const RegularBookingState.loading());
      try {
        Result<PresentationClientInfo> result = await bookInteractor
            .checkClient(
          bookViewModel.surnameController.text,
          bookViewModel.emailController.text,
        );
        if (result is Success<PresentationClientInfo>) {
          bookViewModel.reallyLoaded = true;
          if(result.data.customerId == -1) {
            bookViewModel.newClient = 1;
            bookViewModel.idClient = null;
            emit(const RegularBookingState.loaded());
          } else {
            bookViewModel.newClient = 0;
            bookViewModel.idClient = result.data.customerId;
            //начинаем аренду
            if (bookViewModel.organization == null) {
              PresentationBookingRequest request = bookViewModel
                  .getRegularBookRequest();
              Result<PresentationBook> result2 = await bookInteractor
                  .book(request);
              if (result2 is Success<PresentationBook>) {
                bookViewModel.bookResult = result2.data;
                emit(const RegularBookingState.loaded());
              } else if(result2 is Error<PresentationBook>) {
                emit(RegularBookingState.error(error: result2.errorCode));
              }
            } else {
              PresentationBookingOrgRequest request = bookViewModel
                  .getRegularBookOrgRequest();
              Result<PresentationBook> result2 = await bookInteractor
                  .orgBook(request);
              if (result2 is Success<PresentationBook>) {
                bookViewModel.bookResult = result2.data;
                emit(const RegularBookingState.loaded());
              } else if(result2 is Error<PresentationBook>) {
                emit(RegularBookingState.error(error: result2.errorCode));
              }
            }
          }
        } else if (result is Error<PresentationClientInfo>) {
          emit(RegularBookingState.error(error: result.errorCode));
        }
      } catch (e) {
        emit(RegularBookingState.error(error: e.toString()));
      }
    });
  }
}