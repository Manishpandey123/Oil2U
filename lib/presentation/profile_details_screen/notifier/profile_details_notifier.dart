import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oil2u/core/network/api_s.dart';
import '../../../core/app_export.dart';
import 'package:equatable/equatable.dart';
import '../../../core/network/apis.dart';
import '../../../core/utils/flash_message.dart';
import '../models/profile_details_model.dart';

part 'profile_details_state.dart';

final profileDetailsNotifier =
    StateNotifierProvider<ProfileDetailsNotifier, ProfileDetailsState>(
  (ref) => ProfileDetailsNotifier(ProfileDetailsState(
    profileDetailsModelObj: ProfileDetailsModel(),
  )),
);

/// A notifier that manages the state of a ProfileDetails according to the event that is dispatched to it.
class ProfileDetailsNotifier extends StateNotifier<ProfileDetailsState> {
  ProfileDetailsNotifier(ProfileDetailsState state) : super(state);

  Future<Map<String, dynamic>> getProfile(BuildContext context) async {
    Map<String, dynamic> userData = {};
    try {
      final request = await dio.get(APIs.getUser);
      if (request.statusCode == 200 || request.statusCode == 201) {
        userData = request.data as Map<String, dynamic>;
      }
    } on Exception catch (e) {
      if (e is DioException) {
        showError(
            "${e.response?.data ?? "Failed to get users details!!"}", context);
      }
      showError("error occurred:$e", context);
    }
    return userData;
  }

  Future<Map<String, dynamic>> getHistory(BuildContext context) async {
    Map<String, dynamic> userHistory = {};
    try {
      final request = await dio.get(APIs.getUser + 1.toString());
      if (request.statusCode == 200 || request.statusCode == 201) {
        userHistory = request.data as Map<String, dynamic>;
      }
    } on Exception catch (e) {
      if (e is DioException) {
        showError("${e.response?.data ?? "Failed to get history details!!"}",
            context);
      }
      showError("error occurred:$e", context);
    }
    return userHistory;
  }
}
