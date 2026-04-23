// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'All-purpose-muunnin';

  @override
  String get pickImage => 'Valitse tiedosto';

  @override
  String get pickFromGallery => 'Galleria';

  @override
  String get pickFromFiles => 'Tiedostot';

  @override
  String get pickManyFiles => 'Erä­tiedostot';

  @override
  String get pickFolder => 'Kansio';

  @override
  String get pickFileTitle => 'Valitse lähde';

  @override
  String get targetFormat => 'Kohdeformaatti';

  @override
  String get convert => 'Muunna';

  @override
  String get convertBatch => 'Muunna erä';

  @override
  String get converting => 'Muunnetaan...';

  @override
  String get cancel => 'Peruuta';

  @override
  String get fileTooLarge => 'Tiedosto on liian suuri';

  @override
  String get largeFileWarning =>
      'Suuri tiedosto havaittu. Muunnos voi pienentää kuvan kokoa vakauden vuoksi.';

  @override
  String get notEnoughMemory =>
      'Ei tarpeeksi muistia tämän tiedoston käsittelyyn. Kokeile pienempää kuvaa tai sulje muita sovelluksia.';

  @override
  String get memoryGuardTriggered =>
      'Tiedosto on liian raskas turvalliseen muunnokseen tällä laitteella.';

  @override
  String get batchMemoryGuardTriggered =>
      'Liian monta raskasta tiedostoa valittu kerralla. Jaa erä pienempiin osiin.';

  @override
  String get save => 'Tallenna';

  @override
  String get saving => 'Tallennetaan...';

  @override
  String get saved => 'Tallennettu';

  @override
  String get share => 'Jaa';

  @override
  String get rename => 'Nimeä uudelleen';

  @override
  String get renameOutput => 'Nimeä tuloste uudelleen';

  @override
  String get renameHint => 'Tiedoston nimi ilman päätettä';

  @override
  String get apply => 'Käytä';

  @override
  String get dismiss => 'Sulje';

  @override
  String get emptyStateHint =>
      'Napauta + valitaksesi galleriasta tai tiedostoista';

  @override
  String get conversionFailed => 'Muunnos epäonnistui';

  @override
  String get batchConversionFailed => 'Erämuunnos epäonnistui';

  @override
  String get saveFailed => 'Tallennus epäonnistui';

  @override
  String get pickFailed => 'Valinta epäonnistui';

  @override
  String get tapToPick => 'Napauta valitaksesi tiedoston';

  @override
  String get invalidOrCorruptImage =>
      'Tiedosto ei ole kelvollinen kuva tai vaikuttaa vahingoittuneelta.';

  @override
  String get invalidImageDimensions =>
      'Kuvalla on virheelliset mitat (tyhjä tai nolla).';

  @override
  String get failedToDecodeHeic => 'HEIC-purku epäonnistui';

  @override
  String get failedToEncodeHeic => 'HEIC-koodaus epäonnistui';

  @override
  String get previewNotAvailable =>
      'Esikatselu ei ole käytettävissä tälle muodolle';

  @override
  String get batchPreviewNoThumbnail => 'Ei pikkukuvaa';

  @override
  String get batchPreviewWaiting => 'Pikkukuva muunnoksen jälkeen';

  @override
  String get failedToEncodeAvif => 'AVIF-koodaus epäonnistui';

  @override
  String get formatPairNotSupported => 'Tätä formaattiparia ei tueta';

  @override
  String get pdfRenderUnavailable => 'PDF:ää ei voi esittää tällä laitteella';

  @override
  String get savePdfFailed => 'PDF-tallennus epäonnistui';

  @override
  String get unsupportedInputFormat => 'Tulon formaatti ei ole tuettu';

  @override
  String get open => 'Avaa';

  @override
  String get openFileFailed =>
      'Tiedostoa ei voitu avata toisella sovelluksella';

  @override
  String get openFileUnavailableWeb =>
      'Tiedostojen avaaminen toisessa sovelluksessa ei ole käytettävissä verkossa';

  @override
  String get outputFileEmpty => 'Tulostiedosto on tyhjä';

  @override
  String get outputEncodeRoundTripFailed =>
      'Tulostiedostoa ei voitu lukea tallennuksen jälkeen';

  @override
  String get toggleTheme => 'Vaihda teema';

  @override
  String get policyPreShrinkNoWritableDir =>
      'Väliaikaisen työhakemiston valmistelu tälle tiedostolle epäonnistui. Kokeile toista lähdettä tai vapauta tallennustilaa.';

  @override
  String get conversionHintQuick => 'Valmistuu yleensä muutamassa sekunnissa.';

  @override
  String get conversionHintHeavy =>
      'Suuri tiedosto — muunnos voi kestää ~10–30 sekuntia.';

  @override
  String get conversionHintPdf =>
      'PDF-vienti voi kestää pidempään (~10–30 sekuntia).';

  @override
  String get batchReady => 'Eräjonossa valmiina';

  @override
  String get batchDone => 'Erämuunnos valmis';

  @override
  String get noBatchFiles => 'Ei tiedostoja valittuna erämuunnokseen';

  @override
  String get progressFiles => 'tiedostot';

  @override
  String get batchModeTitle => 'Erämuunnos';

  @override
  String get batchModeSubtitle =>
      'Valitse kohdeformaatti ja muunna sitten kaikki tiedostot. Yksittäistiedoston näkymä on piilotettu tässä tilassa.';

  @override
  String get batchSummaryTotal => 'Yhteensä';

  @override
  String get batchSummaryDone => 'Valmis';

  @override
  String get batchSummaryFailed => 'Epäonnistui';

  @override
  String get batchSummaryQueued => 'Jonossa';

  @override
  String get saveAllSuccessful => 'Kaikki tallennettiin onnistuneesti';

  @override
  String get batchSaveAllStarting => 'Tallennetaan tiedostoja...';

  @override
  String batchSaveAllProgressLabel(int current, int total) {
    return 'Tallennetaan $current/$total';
  }

  @override
  String get retryFailed => 'Yritä uudelleen';

  @override
  String get clearCompleted => 'Tyhjennä valmiit';

  @override
  String get clearCompletedTooltip =>
      'Poista tästä luettelosta kohteet, jotka on merkitty tallennetuiksi';

  @override
  String get clearBatchQueue => 'Tyhjennä jono';

  @override
  String get batchStatusQueued => 'Jonossa';

  @override
  String get batchStatusConverting => 'Muunnetaan';

  @override
  String get batchStatusDone => 'Valmis';

  @override
  String get batchStatusFailed => 'Epäonnistui';

  @override
  String get batchStatusSaving => 'Tallennetaan';

  @override
  String get batchStatusSaved => 'Tallennettu';

  @override
  String get batchStatusCancelled => 'Peruutettu';

  @override
  String get appNameWebSuffix => '(Web)';

  @override
  String get download => 'Lataa';

  @override
  String get language => 'Kieli';

  @override
  String get systemLanguage => 'Järjestelmän oletus';

  @override
  String get errorDialogTitle => 'Virhe';

  @override
  String get pickedFileCaption => 'Valittu tiedosto';

  @override
  String get keepScreenOn => 'Pidä näyttö päällä';

  @override
  String get keepScreenOnTooltip =>
      'Estä laitteen näytön sammuminen, kun sovellus on aktiivinen.';
}
