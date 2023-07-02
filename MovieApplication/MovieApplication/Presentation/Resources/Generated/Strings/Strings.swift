// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Accessibility {
    /// Filter by?
    internal static let filterBy = L10n.tr("Localizable", "accessibility.filterBy", fallback: "Filter by?")
  }
  internal enum Label {
    /// Dark Mode
    internal static let darkMode = L10n.tr("Localizable", "label.darkMode", fallback: "Dark Mode")
    /// Episodes
    internal static let episodes = L10n.tr("Localizable", "label.episodes", fallback: "Episodes")
    /// Movies
    internal static let movies = L10n.tr("Localizable", "label.movies", fallback: "Movies")
    /// %@ (%@ reviews)
    internal static func ratingString(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "label.ratingString", String(describing: p1), String(describing: p2), fallback: "%@ (%@ reviews)")
    }
    /// Search
    internal static let search = L10n.tr("Localizable", "label.search", fallback: "Search")
    /// Series
    internal static let series = L10n.tr("Localizable", "label.series", fallback: "Series")
  }
  internal enum Message {
    /// Please try again later.
    internal static let tryAgainlater = L10n.tr("Localizable", "message.tryAgainlater", fallback: "Please try again later.")
    /// Please try other keywords.
    internal static let tryOtherKeywords = L10n.tr("Localizable", "message.tryOtherKeywords", fallback: "Please try other keywords.")
  }
  internal enum Placeholder {
    /// What are you looking for?
    internal static let whatAreYouLookingFor = L10n.tr("Localizable", "placeholder.whatAreYouLookingFor", fallback: "What are you looking for?")
  }
  internal enum Sample {
    /// Localizable.strings
    ///   MovieApplication
    /// 
    ///   Created by Jeofferson Dela Peña on 6/29/23.
    internal static let title = L10n.tr("Localizable", "sample.title", fallback: "Lorem Ipsum")
    /// https://picsum.photos/200
    internal static let url = L10n.tr("Localizable", "sample.url", fallback: "https://picsum.photos/200")
  }
  internal enum Title {
    /// Movie App
    internal static let movieApp = L10n.tr("Localizable", "title.movieApp", fallback: "Movie App")
    /// Movie Details
    internal static let movieDetails = L10n.tr("Localizable", "title.movieDetails", fallback: "Movie Details")
    /// Movies 2023
    internal static let movies2023 = L10n.tr("Localizable", "title.movies2023", fallback: "Movies 2023")
    /// No Results
    internal static let noResults = L10n.tr("Localizable", "title.noResults", fallback: "No Results")
    /// Search
    internal static let search = L10n.tr("Localizable", "title.search", fallback: "Search")
    /// Series 2023
    internal static let series2023 = L10n.tr("Localizable", "title.series2023", fallback: "Series 2023")
    /// Series Details
    internal static let seriesDetails = L10n.tr("Localizable", "title.seriesDetails", fallback: "Series Details")
    /// Show Details
    internal static let showDetails = L10n.tr("Localizable", "title.showDetails", fallback: "Show Details")
    /// Something Went Wrong
    internal static let somethingWentWrong = L10n.tr("Localizable", "title.somethingWentWrong", fallback: "Something Went Wrong")
    /// With New Episodes This Month
    internal static let withNewEpisodesThisMonth = L10n.tr("Localizable", "title.withNewEpisodesThisMonth", fallback: "With New Episodes This Month")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
