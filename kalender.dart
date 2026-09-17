import 'dart:io';

List<String> Monat = [
  "Januar",
  "Februar",
  "März",
  "April",
  "Mai",
  "Juni",
  "Juli",
  "August",
  "September",
  "Oktober",
  "November",
  "Dezember",
];

List<String> Wochentag = [
  "Montag",
  "Dienstag",
  "Mittwoch",
  "Donnerstag",
  "Freitag",
  "Samstag",
  "Sonntag",
];

List<String> WievielterWochentag = [
  "erste",
  "zweite",
  "dritte",
  "vierte",
  "fünfte",
];

var Datum = DateTime.now();

int Jahr = DateTime.now().year;
int MonatZahl = DateTime.now().month;

void main() {
  kalender(Jahr, Datum);
  historischeEreignisse(Datum);
  infotext(Monat, Wochentag, WievielterWochentag);
}

void infotext(Monat, Wochentag, WievielterWochentag) {
  print(
    "Der ${Datum.day}.${Datum.month}.${Datum.year} "
    "ist ein ${Wochentag[Datum.weekday - 1]} "
    "und zwar der ${WievielterWochentag[(Datum.day - 1) ~/ 7]} "
    "im Monat ${Monat[Datum.month - 1]}.",
  );
}

void kalender(int Jahr, DateTime Datum) {
  print("${Monat[Datum.month - 1]} $Jahr");
  stdout.write("\n");
  print("Mo\tDi\tMi\tDo\tFr\tSa\tSo");

  int anzahlTage = DateTime(Jahr, MonatZahl + 1, 0).day;
  int ersterTag = DateTime(Jahr, MonatZahl, 1).weekday;

  for (int i = 1; i < ersterTag; i++) {
    stdout.write("\t");
  }

  for (int tag = 1; tag <= anzahlTage; tag++) {
    stdout.write("$tag\t");

    if ((ersterTag + tag - 1) % 7 == 0) {
      print("");
    }
  }

  stdout.write("\n");
}

void historischeEreignisse(DateTime Datum) {
  print("\nHistorische Ereignisse am ${Datum.day}.${Datum.month}.");
  stdout.write("\n");
}
