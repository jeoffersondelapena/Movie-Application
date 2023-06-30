// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Label {
    /// Episodes
    internal static let episodes = L10n.tr("Localizable", "label.episodes", fallback: "Episodes")
    /// Movies
    internal static let movies = L10n.tr("Localizable", "label.movies", fallback: "Movies")
    /// Localizable.strings
    ///   MovieApplication
    /// 
    ///   Created by Jeofferson Dela Peña on 6/29/23.
    internal static func ratingString(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "label.ratingString", String(describing: p1), String(describing: p2), fallback: "%@ (%@ reviews)")
    }
    /// Series
    internal static let series = L10n.tr("Localizable", "label.series", fallback: "Series")
  }
  internal enum Title {
    /// Movie Details
    internal static let movieDetails = L10n.tr("Localizable", "title.movieDetails", fallback: "Movie Details")
    /// Movies
    internal static let movies = L10n.tr("Localizable", "title.movies", fallback: "Movies")
    /// Series
    internal static let series = L10n.tr("Localizable", "title.series", fallback: "Series")
    /// Series Details
    internal static let seriesDetails = L10n.tr("Localizable", "title.seriesDetails", fallback: "Series Details")
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
