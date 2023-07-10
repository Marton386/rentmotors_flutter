import 'package:flutter/material.dart';
import '../models/responses/presentation_station.dart';

class StationViewModel {
  int selectedStation = -1;
  List<PresentationStation> stations = [];
  List<PresentationStation> filteredStations = [];
  TextEditingController stationController = TextEditingController();

  void setStations(List<PresentationStation> list) {
    stations = list;
    filteredStations = list;
  }

  void updateFilteredStations() {
    final searchText = stationController.text.toLowerCase();

    if (searchText.isEmpty) {
      filteredStations = List.from(stations);
    } else {
      filteredStations = stations.where((station) {
        final stationName = station.name.toLowerCase();
        return stationName.contains(searchText);
      }).toList();
    }
  }

  void selectStation(int stationID) {
    int counter = 0;
    while ((counter <= stations.length-1) && (selectedStation == -1)) {
      if (stations[counter].id == stationID) {
        selectedStation = counter;
      }
      counter++;
    }
  }
}