import class Foundation.Bundle

public let adaptiveCardBundle = Bundle.adaptiveCardModule

private class ACBundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var adaptiveCardModule: Bundle = {
        let bundleName = "AdaptiveCardUI_AdaptiveCardUI"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: ACBundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,

            // Bundle should be present here when running previews from a different package (this is the path to "…/Debug-iphonesimulator/").
            Bundle(for: ACBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),

            Bundle(for: ACBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named EmbeddableVoiceAssistant_EmbeddableVoiceAssistant")
    }()
}
