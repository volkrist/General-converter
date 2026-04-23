import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sr'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Generic Converter'**
  String get appName;

  /// No description provided for @pickImage.
  ///
  /// In en, this message translates to:
  /// **'Pick file'**
  String get pickImage;

  /// No description provided for @pickFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get pickFromGallery;

  /// No description provided for @pickFromFiles.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get pickFromFiles;

  /// No description provided for @pickManyFiles.
  ///
  /// In en, this message translates to:
  /// **'Batch files'**
  String get pickManyFiles;

  /// No description provided for @pickFolder.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get pickFolder;

  /// No description provided for @pickFileTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose source'**
  String get pickFileTitle;

  /// No description provided for @targetFormat.
  ///
  /// In en, this message translates to:
  /// **'Target format'**
  String get targetFormat;

  /// No description provided for @convert.
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// No description provided for @convertBatch.
  ///
  /// In en, this message translates to:
  /// **'Convert batch'**
  String get convertBatch;

  /// No description provided for @converting.
  ///
  /// In en, this message translates to:
  /// **'Converting...'**
  String get converting;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @fileTooLarge.
  ///
  /// In en, this message translates to:
  /// **'File is too large'**
  String get fileTooLarge;

  /// No description provided for @largeFileWarning.
  ///
  /// In en, this message translates to:
  /// **'Large file detected. Conversion may reduce image size for stability.'**
  String get largeFileWarning;

  /// No description provided for @notEnoughMemory.
  ///
  /// In en, this message translates to:
  /// **'Not enough memory to process this file. Try a smaller image or close other apps.'**
  String get notEnoughMemory;

  /// No description provided for @memoryGuardTriggered.
  ///
  /// In en, this message translates to:
  /// **'File is too heavy for safe conversion on this device.'**
  String get memoryGuardTriggered;

  /// No description provided for @batchMemoryGuardTriggered.
  ///
  /// In en, this message translates to:
  /// **'Too many heavy files selected at once. Split the batch into smaller parts.'**
  String get batchMemoryGuardTriggered;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @renameOutput.
  ///
  /// In en, this message translates to:
  /// **'Rename output'**
  String get renameOutput;

  /// No description provided for @renameHint.
  ///
  /// In en, this message translates to:
  /// **'File name without extension'**
  String get renameHint;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @emptyStateHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to pick from gallery or files'**
  String get emptyStateHint;

  /// No description provided for @conversionFailed.
  ///
  /// In en, this message translates to:
  /// **'Conversion failed'**
  String get conversionFailed;

  /// No description provided for @batchConversionFailed.
  ///
  /// In en, this message translates to:
  /// **'Batch conversion failed'**
  String get batchConversionFailed;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save'**
  String get saveFailed;

  /// No description provided for @pickFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image'**
  String get pickFailed;

  /// No description provided for @tapToPick.
  ///
  /// In en, this message translates to:
  /// **'Tap to pick a file'**
  String get tapToPick;

  /// No description provided for @invalidOrCorruptImage.
  ///
  /// In en, this message translates to:
  /// **'The file is not a valid image or appears to be damaged.'**
  String get invalidOrCorruptImage;

  /// No description provided for @invalidImageDimensions.
  ///
  /// In en, this message translates to:
  /// **'The image has invalid size (empty or zero dimensions).'**
  String get invalidImageDimensions;

  /// No description provided for @failedToDecodeHeic.
  ///
  /// In en, this message translates to:
  /// **'Failed to decode HEIC'**
  String get failedToDecodeHeic;

  /// No description provided for @failedToEncodeHeic.
  ///
  /// In en, this message translates to:
  /// **'Failed to encode HEIC'**
  String get failedToEncodeHeic;

  /// No description provided for @previewNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Preview is not available for this format'**
  String get previewNotAvailable;

  /// No description provided for @batchPreviewNoThumbnail.
  ///
  /// In en, this message translates to:
  /// **'No thumbnail'**
  String get batchPreviewNoThumbnail;

  /// No description provided for @batchPreviewWaiting.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail after conversion'**
  String get batchPreviewWaiting;

  /// No description provided for @failedToEncodeAvif.
  ///
  /// In en, this message translates to:
  /// **'Failed to encode AVIF'**
  String get failedToEncodeAvif;

  /// No description provided for @formatPairNotSupported.
  ///
  /// In en, this message translates to:
  /// **'This format pair is not supported'**
  String get formatPairNotSupported;

  /// No description provided for @pdfRenderUnavailable.
  ///
  /// In en, this message translates to:
  /// **'PDF could not be rendered on this device'**
  String get pdfRenderUnavailable;

  /// No description provided for @savePdfFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save PDF'**
  String get savePdfFailed;

  /// No description provided for @unsupportedInputFormat.
  ///
  /// In en, this message translates to:
  /// **'Unsupported input format'**
  String get unsupportedInputFormat;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @openFileFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open file with another app'**
  String get openFileFailed;

  /// No description provided for @openFileUnavailableWeb.
  ///
  /// In en, this message translates to:
  /// **'Opening files in another app is not available on web'**
  String get openFileUnavailableWeb;

  /// No description provided for @outputFileEmpty.
  ///
  /// In en, this message translates to:
  /// **'Output file is empty'**
  String get outputFileEmpty;

  /// No description provided for @outputEncodeRoundTripFailed.
  ///
  /// In en, this message translates to:
  /// **'Output file was not readable after save'**
  String get outputEncodeRoundTripFailed;

  /// No description provided for @toggleTheme.
  ///
  /// In en, this message translates to:
  /// **'Toggle theme'**
  String get toggleTheme;

  /// No description provided for @policyPreShrinkNoWritableDir.
  ///
  /// In en, this message translates to:
  /// **'Cannot prepare a temporary workspace for this file. Try another source or free storage.'**
  String get policyPreShrinkNoWritableDir;

  /// No description provided for @conversionHintQuick.
  ///
  /// In en, this message translates to:
  /// **'Usually finishes in a few seconds.'**
  String get conversionHintQuick;

  /// No description provided for @conversionHintHeavy.
  ///
  /// In en, this message translates to:
  /// **'Large file — conversion may take ~10–30 seconds.'**
  String get conversionHintHeavy;

  /// No description provided for @conversionHintPdf.
  ///
  /// In en, this message translates to:
  /// **'PDF export may take longer (~10–30 seconds).'**
  String get conversionHintPdf;

  /// No description provided for @batchReady.
  ///
  /// In en, this message translates to:
  /// **'Batch queue is ready'**
  String get batchReady;

  /// No description provided for @batchDone.
  ///
  /// In en, this message translates to:
  /// **'Batch conversion completed'**
  String get batchDone;

  /// No description provided for @noBatchFiles.
  ///
  /// In en, this message translates to:
  /// **'No files selected for batch conversion'**
  String get noBatchFiles;

  /// No description provided for @progressFiles.
  ///
  /// In en, this message translates to:
  /// **'files'**
  String get progressFiles;

  /// No description provided for @batchModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Batch conversion'**
  String get batchModeTitle;

  /// No description provided for @batchModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose target format, then convert all files. Single-file view is hidden in this mode.'**
  String get batchModeSubtitle;

  /// No description provided for @batchSummaryTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get batchSummaryTotal;

  /// No description provided for @batchSummaryDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get batchSummaryDone;

  /// No description provided for @batchSummaryFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get batchSummaryFailed;

  /// No description provided for @batchSummaryQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get batchSummaryQueued;

  /// No description provided for @saveAllSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Save all successful'**
  String get saveAllSuccessful;

  /// No description provided for @batchSaveAllStarting.
  ///
  /// In en, this message translates to:
  /// **'Saving files...'**
  String get batchSaveAllStarting;

  /// No description provided for @batchSaveAllProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Saving {current}/{total}'**
  String batchSaveAllProgressLabel(int current, int total);

  /// No description provided for @retryFailed.
  ///
  /// In en, this message translates to:
  /// **'Retry failed'**
  String get retryFailed;

  /// No description provided for @clearCompleted.
  ///
  /// In en, this message translates to:
  /// **'Clear completed'**
  String get clearCompleted;

  /// No description provided for @clearCompletedTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove items marked as saved from this list'**
  String get clearCompletedTooltip;

  /// No description provided for @clearBatchQueue.
  ///
  /// In en, this message translates to:
  /// **'Clear queue'**
  String get clearBatchQueue;

  /// No description provided for @batchStatusQueued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get batchStatusQueued;

  /// No description provided for @batchStatusConverting.
  ///
  /// In en, this message translates to:
  /// **'Converting'**
  String get batchStatusConverting;

  /// No description provided for @batchStatusDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get batchStatusDone;

  /// No description provided for @batchStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get batchStatusFailed;

  /// No description provided for @batchStatusSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get batchStatusSaving;

  /// No description provided for @batchStatusSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get batchStatusSaved;

  /// No description provided for @batchStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get batchStatusCancelled;

  /// No description provided for @appNameWebSuffix.
  ///
  /// In en, this message translates to:
  /// **'(Web)'**
  String get appNameWebSuffix;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemLanguage;

  /// No description provided for @errorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorDialogTitle;

  /// No description provided for @pickedFileCaption.
  ///
  /// In en, this message translates to:
  /// **'Picked file'**
  String get pickedFileCaption;

  /// No description provided for @keepScreenOn.
  ///
  /// In en, this message translates to:
  /// **'Keep screen on'**
  String get keepScreenOn;

  /// No description provided for @keepScreenOnTooltip.
  ///
  /// In en, this message translates to:
  /// **'Prevent the device display from turning off while the app is active.'**
  String get keepScreenOnTooltip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fr',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sr',
    'sv',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
