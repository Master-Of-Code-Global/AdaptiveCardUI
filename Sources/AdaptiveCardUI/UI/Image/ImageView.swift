#if canImport(SwiftUI)

    import struct AdaptiveCard.Image
    import NetworkImage
    import SwiftUI

    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    struct ImageView: View {
        @Environment(\.imageSizeConfiguration) private var imageSizeConfiguration
        
        private let image: Image

        init(_ image: Image) {
            self.image = image
        }

        var body: some View {
            NetworkImage(url: image.url)
                .selectAction(image.selectAction)
                .networkImageStyle(
                    PrimitiveImageStyle(
                        width: image.width?.cgFloatValue,
                        height: image.height.cgFloatValue,
                        size: image.size,
                        horizontalAlignment: image.horizontalAlignment,
                        style: image.style,
                        backgroundColor: Color(argbHex: image.backgroundColor)
                    )
                )
                .imageFrame(image.size, config: imageSizeConfiguration)
        }
    }
    
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension View {
    
    @ViewBuilder
    func imageFrame(_ size: ImageSize, config: ImageSizeConfiguration) -> some View {
        switch size {
        case .small:
            frame(minHeight: config.small)
        case .medium:
            frame(minHeight: config.medium)
        case .large:
            frame(minHeight: config.large)
        default:
            self
        }
    }
}

#endif
