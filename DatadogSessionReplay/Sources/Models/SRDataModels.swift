/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-Present Datadog, Inc.
 */

#if os(iOS)
import DatadogInternal

// This file was generated from JSON Schema. Do not modify it directly.

internal protocol SRDataModel: Codable {}

/// Mobile-specific. Schema of a Session Replay data Segment.
@_spi(Internal)
public struct SRSegment: SRDataModel {
    /// Application properties
    public let application: Application

    /// The end UTC timestamp in milliseconds corresponding to the last record in the Segment data. Each timestamp is computed as the UTC interval since 00:00:00.000 01.01.1970.
    public let end: Int64

    /// Whether this Segment contains a full snapshot record or not.
    public let hasFullSnapshot: Bool?

    /// The index of this Segment in the segments list that was recorded for this view ID. Starts from 0.
    public let indexInView: Int64?

    /// The records contained by this Segment.
    public let records: [SRRecord]

    /// The number of records in this Segment.
    public let recordsCount: Int64

    /// Session properties
    public let session: Session

    /// The source of this record
    public let source: Source

    /// The start UTC timestamp in milliseconds corresponding to the first record in the Segment data. Each timestamp is computed as the UTC interval since 00:00:00.000 01.01.1970.
    public let start: Int64

    /// View properties
    public let view: View

    enum CodingKeys: String, CodingKey {
        case application = "application"
        case end = "end"
        case hasFullSnapshot = "has_full_snapshot"
        case indexInView = "index_in_view"
        case records = "records"
        case recordsCount = "records_count"
        case session = "session"
        case source = "source"
        case start = "start"
        case view = "view"
    }

    /// Application properties
    @_spi(Internal)
    public struct Application: Codable {
        /// UUID of the application
        public let id: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
        }
    }

    /// Session properties
    @_spi(Internal)
    public struct Session: Codable {
        /// UUID of the session
        public let id: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
        }
    }

    /// The source of this record
    @_spi(Internal)
    public enum Source: String, Codable {
        case android = "android"
        case ios = "ios"
        case flutter = "flutter"
        case reactNative = "react-native"
    }

    /// View properties
    @_spi(Internal)
    public struct View: Codable {
        /// UUID of the view
        public let id: String

        enum CodingKeys: String, CodingKey {
            case id = "id"
        }
    }
}

/// The border properties of this wireframe. The default value is null (no-border).
@_spi(Internal)
public struct SRShapeBorder: Codable, Hashable {
    /// The border color as a String hexadecimal. Follows the #RRGGBBAA color format with the alpha value as optional.
    public let color: String

    /// The width of the border in pixels.
    public let width: Int64

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case width = "width"
    }
}

/// Schema of clipping information for a Wireframe.
@_spi(Internal)
public struct SRContentClip: Codable, Hashable {
    /// The amount of space in pixels that needs to be clipped (masked) at the bottom of the wireframe.
    public let bottom: Int64?

    /// The amount of space in pixels that needs to be clipped (masked) at the left of the wireframe.
    public let left: Int64?

    /// The amount of space in pixels that needs to be clipped (masked) at the right of the wireframe.
    public let right: Int64?

    /// The amount of space in pixels that needs to be clipped (masked) at the top of the wireframe.
    public let top: Int64?

    enum CodingKeys: String, CodingKey {
        case bottom = "bottom"
        case left = "left"
        case right = "right"
        case top = "top"
    }
}

/// The style of this wireframe.
@_spi(Internal)
public struct SRShapeStyle: Codable, Hashable {
    /// The background color for this wireframe as a String hexadecimal. Follows the #RRGGBBAA color format with the alpha value as optional. The default value is #FFFFFF00.
    public let backgroundColor: String?

    /// The corner(border) radius of this wireframe in pixels. The default value is 0.
    public let cornerRadius: Double?

    /// The opacity of this wireframe. Takes values from 0 to 1, default value is 1.
    public let opacity: Double?

    enum CodingKeys: String, CodingKey {
        case backgroundColor = "backgroundColor"
        case cornerRadius = "cornerRadius"
        case opacity = "opacity"
    }
}

/// Schema of all properties of a ShapeWireframe.
@_spi(Internal)
public struct SRShapeWireframe: Codable, Hashable {
    /// The border properties of this wireframe. The default value is null (no-border).
    public let border: SRShapeBorder?

    /// Schema of clipping information for a Wireframe.
    public let clip: SRContentClip?

    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
    public let height: Int64

    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
    public let id: Int64

    /// The style of this wireframe.
    public let shapeStyle: SRShapeStyle?

    /// The type of the wireframe.
    public let type: String = "shape"

    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
    public let width: Int64

    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let x: Int64

    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let y: Int64

    enum CodingKeys: String, CodingKey {
        case border = "border"
        case clip = "clip"
        case height = "height"
        case id = "id"
        case shapeStyle = "shapeStyle"
        case type = "type"
        case width = "width"
        case x = "x"
        case y = "y"
    }
}

/// Schema of all properties of a TextPosition.
@_spi(Internal)
public struct SRTextPosition: Codable, Hashable {
    public let alignment: Alignment?

    public let padding: Padding?

    enum CodingKeys: String, CodingKey {
        case alignment = "alignment"
        case padding = "padding"
    }

    @_spi(Internal)
    public struct Alignment: Codable, Hashable {
        /// The horizontal text alignment. The default value is `left`.
        public let horizontal: Horizontal?

        /// The vertical text alignment. The default value is `top`.
        public let vertical: Vertical?

        enum CodingKeys: String, CodingKey {
            case horizontal = "horizontal"
            case vertical = "vertical"
        }

        /// The horizontal text alignment. The default value is `left`.
        @_spi(Internal)
        public enum Horizontal: String, Codable {
            case left = "left"
            case right = "right"
            case center = "center"
        }

        /// The vertical text alignment. The default value is `top`.
        @_spi(Internal)
        public enum Vertical: String, Codable {
            case top = "top"
            case bottom = "bottom"
            case center = "center"
        }
    }

    @_spi(Internal)
    public struct Padding: Codable, Hashable {
        /// The bottom padding in pixels. The default value is 0.
        public let bottom: Int64?

        /// The left padding in pixels. The default value is 0.
        public let left: Int64?

        /// The right padding in pixels. The default value is 0.
        public let right: Int64?

        /// The top padding in pixels. The default value is 0.
        public let top: Int64?

        enum CodingKeys: String, CodingKey {
            case bottom = "bottom"
            case left = "left"
            case right = "right"
            case top = "top"
        }
    }
}

/// Schema of all properties of a TextStyle.
@_spi(Internal)
public struct SRTextStyle: Codable, Hashable {
    /// The font color as a string hexadecimal. Follows the #RRGGBBAA color format with the alpha value as optional.
    public let color: String

    /// The preferred font family collection, ordered by preference and formatted as a String list: e.g. Century Gothic, Verdana, sans-serif
    public let family: String

    /// The font size in pixels.
    public let size: Int64

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case family = "family"
        case size = "size"
    }
}

/// Schema of all properties of a TextWireframe.
@_spi(Internal)
public struct SRTextWireframe: Codable, Hashable {
    /// The border properties of this wireframe. The default value is null (no-border).
    public let border: SRShapeBorder?

    /// Schema of clipping information for a Wireframe.
    public let clip: SRContentClip?

    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
    public let height: Int64

    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
    public let id: Int64

    /// The style of this wireframe.
    public let shapeStyle: SRShapeStyle?

    /// The text value of the wireframe.
    public var text: String

    /// Schema of all properties of a TextPosition.
    public let textPosition: SRTextPosition?

    /// Schema of all properties of a TextStyle.
    public let textStyle: SRTextStyle

    /// The type of the wireframe.
    public let type: String = "text"

    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
    public let width: Int64

    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let x: Int64

    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let y: Int64

    enum CodingKeys: String, CodingKey {
        case border = "border"
        case clip = "clip"
        case height = "height"
        case id = "id"
        case shapeStyle = "shapeStyle"
        case text = "text"
        case textPosition = "textPosition"
        case textStyle = "textStyle"
        case type = "type"
        case width = "width"
        case x = "x"
        case y = "y"
    }
}

/// Schema of all properties of a ImageWireframe.
@_spi(Internal)
public struct SRImageWireframe: Codable, Hashable {
    /// base64 representation of the image. Not required as the ImageWireframe can be initialised without any base64
    public var base64: String?

    /// The border properties of this wireframe. The default value is null (no-border).
    public let border: SRShapeBorder?

    /// Schema of clipping information for a Wireframe.
    public let clip: SRContentClip?

    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
    public let height: Int64

    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
    public let id: Int64

    /// Flag describing an image wireframe that should render an empty state placeholder
    public var isEmpty: Bool?

    /// MIME type of the image file
    public var mimeType: String?

    /// Unique identifier of the image resource
    public var resourceId: String?

    /// The style of this wireframe.
    public let shapeStyle: SRShapeStyle?

    /// The type of the wireframe.
    public let type: String = "image"

    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
    public let width: Int64

    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let x: Int64

    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let y: Int64

    enum CodingKeys: String, CodingKey {
        case base64 = "base64"
        case border = "border"
        case clip = "clip"
        case height = "height"
        case id = "id"
        case isEmpty = "isEmpty"
        case mimeType = "mimeType"
        case resourceId = "resourceId"
        case shapeStyle = "shapeStyle"
        case type = "type"
        case width = "width"
        case x = "x"
        case y = "y"
    }
}

/// Schema of all properties of a PlaceholderWireframe.
@_spi(Internal)
public struct SRPlaceholderWireframe: Codable, Hashable {
    /// Schema of clipping information for a Wireframe.
    public let clip: SRContentClip?

    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
    public let height: Int64

    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
    public let id: Int64

    /// Label of the placeholder
    public var label: String?

    /// The type of the wireframe.
    public let type: String = "placeholder"

    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
    public let width: Int64

    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let x: Int64

    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let y: Int64

    enum CodingKeys: String, CodingKey {
        case clip = "clip"
        case height = "height"
        case id = "id"
        case label = "label"
        case type = "type"
        case width = "width"
        case x = "x"
        case y = "y"
    }
}

/// Schema of all properties of a WebviewWireframe.
@_spi(Internal)
public struct SRWebviewWireframe: Codable, Hashable {
    /// The border properties of this wireframe. The default value is null (no-border).
    public let border: SRShapeBorder?

    /// Schema of clipping information for a Wireframe.
    public let clip: SRContentClip?

    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
    public let height: Int64

    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
    public let id: Int64

    /// Whether this web-view is visible or not.
    public let isVisible: Bool?

    /// The style of this wireframe.
    public let shapeStyle: SRShapeStyle?

    /// Unique Id of the slot containing this webview.
    public let slotId: String

    /// The type of the wireframe.
    public let type: String = "webview"

    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
    public let width: Int64

    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let x: Int64

    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
    public let y: Int64

    enum CodingKeys: String, CodingKey {
        case border = "border"
        case clip = "clip"
        case height = "height"
        case id = "id"
        case isVisible = "isVisible"
        case shapeStyle = "shapeStyle"
        case slotId = "slotId"
        case type = "type"
        case width = "width"
        case x = "x"
        case y = "y"
    }
}

/// Schema of a Wireframe type.
@_spi(Internal)
public enum SRWireframe: Codable {
    case shapeWireframe(value: SRShapeWireframe)
    case textWireframe(value: SRTextWireframe)
    case imageWireframe(value: SRImageWireframe)
    case placeholderWireframe(value: SRPlaceholderWireframe)
    case webviewWireframe(value: SRWebviewWireframe)

    // MARK: - Codable

    public func encode(to encoder: Encoder) throws {
        // Encode only the associated value, without encoding enum case
        var container = encoder.singleValueContainer()

        switch self {
        case .shapeWireframe(let value):
            try container.encode(value)
        case .textWireframe(let value):
            try container.encode(value)
        case .imageWireframe(let value):
            try container.encode(value)
        case .placeholderWireframe(let value):
            try container.encode(value)
        case .webviewWireframe(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        // Decode enum case from associated value
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(SRShapeWireframe.self) {
            self = .shapeWireframe(value: value)
            return
        }
        if let value = try? container.decode(SRTextWireframe.self) {
            self = .textWireframe(value: value)
            return
        }
        if let value = try? container.decode(SRImageWireframe.self) {
            self = .imageWireframe(value: value)
            return
        }
        if let value = try? container.decode(SRPlaceholderWireframe.self) {
            self = .placeholderWireframe(value: value)
            return
        }
        if let value = try? container.decode(SRWebviewWireframe.self) {
            self = .webviewWireframe(value: value)
            return
        }
        let error = DecodingError.Context(
            codingPath: container.codingPath,
            debugDescription: """
            Failed to decode `SRWireframe`.
            Ran out of possibilities when trying to decode the value of associated type.
            """
        )
        throw DecodingError.typeMismatch(SRWireframe.self, error)
    }
}

/// Mobile-specific. Schema of a Record type which contains the full snapshot of a screen.
@_spi(Internal)
public struct SRFullSnapshotRecord: Codable {
    public let data: Data

    /// Defines the UTC time in milliseconds when this Record was performed.
    public let timestamp: Int64

    /// The type of this Record.
    public let type: Int64 = 10

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case timestamp = "timestamp"
        case type = "type"
    }

    @_spi(Internal)
    public struct Data: Codable {
        /// The Wireframes contained by this Record.
        public let wireframes: [SRWireframe]

        enum CodingKeys: String, CodingKey {
            case wireframes = "wireframes"
        }
    }
}

/// Mobile-specific. Schema of a Record type which contains mutations of a screen.
@_spi(Internal)
public struct SRIncrementalSnapshotRecord: Codable {
    /// Mobile-specific. Schema of a Session Replay IncrementalData type.
    public let data: Data

    /// Defines the UTC time in milliseconds when this Record was performed.
    public let timestamp: Int64

    /// The type of this Record.
    public let type: Int64 = 11

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case timestamp = "timestamp"
        case type = "type"
    }

    /// Mobile-specific. Schema of a Session Replay IncrementalData type.
    @_spi(Internal)
    public enum Data: Codable {
        case mutationData(value: MutationData)
        case touchData(value: TouchData)
        case viewportResizeData(value: ViewportResizeData)
        case pointerInteractionData(value: PointerInteractionData)

        // MARK: - Codable

        public func encode(to encoder: Encoder) throws {
            // Encode only the associated value, without encoding enum case
            var container = encoder.singleValueContainer()

            switch self {
            case .mutationData(let value):
                try container.encode(value)
            case .touchData(let value):
                try container.encode(value)
            case .viewportResizeData(let value):
                try container.encode(value)
            case .pointerInteractionData(let value):
                try container.encode(value)
            }
        }

        public init(from decoder: Decoder) throws {
            // Decode enum case from associated value
            let container = try decoder.singleValueContainer()

            if let value = try? container.decode(MutationData.self) {
                self = .mutationData(value: value)
                return
            }
            if let value = try? container.decode(TouchData.self) {
                self = .touchData(value: value)
                return
            }
            if let value = try? container.decode(ViewportResizeData.self) {
                self = .viewportResizeData(value: value)
                return
            }
            if let value = try? container.decode(PointerInteractionData.self) {
                self = .pointerInteractionData(value: value)
                return
            }
            let error = DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: """
                Failed to decode `Data`.
                Ran out of possibilities when trying to decode the value of associated type.
                """
            )
            throw DecodingError.typeMismatch(Data.self, error)
        }

        /// Mobile-specific. Schema of a MutationData.
        @_spi(Internal)
        public struct MutationData: Codable {
            /// Contains the newly added wireframes.
            public let adds: [Adds]

            /// Contains the removed wireframes as an array of ids.
            public let removes: [Removes]

            /// The source of this type of incremental data.
            public let source: Int64 = 0

            /// Contains the updated wireframes mutations.
            public let updates: [Updates]

            enum CodingKeys: String, CodingKey {
                case adds = "adds"
                case removes = "removes"
                case source = "source"
                case updates = "updates"
            }

            @_spi(Internal)
            public struct Adds: Codable {
                /// The previous wireframe id next or after which this new wireframe is drawn or attached to, respectively.
                public let previousId: Int64?

                /// Schema of a Wireframe type.
                public let wireframe: SRWireframe

                enum CodingKeys: String, CodingKey {
                    case previousId = "previousId"
                    case wireframe = "wireframe"
                }
            }

            @_spi(Internal)
            public struct Removes: Codable {
                /// The id of the wireframe that needs to be removed.
                public let id: Int64

                enum CodingKeys: String, CodingKey {
                    case id = "id"
                }
            }

            /// Schema of a WireframeUpdateMutation type.
            @_spi(Internal)
            public enum Updates: Codable {
                case textWireframeUpdate(value: TextWireframeUpdate)
                case shapeWireframeUpdate(value: ShapeWireframeUpdate)
                case imageWireframeUpdate(value: ImageWireframeUpdate)
                case placeholderWireframeUpdate(value: PlaceholderWireframeUpdate)
                case webviewWireframeUpdate(value: WebviewWireframeUpdate)

                // MARK: - Codable

                public func encode(to encoder: Encoder) throws {
                    // Encode only the associated value, without encoding enum case
                    var container = encoder.singleValueContainer()

                    switch self {
                    case .textWireframeUpdate(let value):
                        try container.encode(value)
                    case .shapeWireframeUpdate(let value):
                        try container.encode(value)
                    case .imageWireframeUpdate(let value):
                        try container.encode(value)
                    case .placeholderWireframeUpdate(let value):
                        try container.encode(value)
                    case .webviewWireframeUpdate(let value):
                        try container.encode(value)
                    }
                }

                public init(from decoder: Decoder) throws {
                    // Decode enum case from associated value
                    let container = try decoder.singleValueContainer()

                    if let value = try? container.decode(TextWireframeUpdate.self) {
                        self = .textWireframeUpdate(value: value)
                        return
                    }
                    if let value = try? container.decode(ShapeWireframeUpdate.self) {
                        self = .shapeWireframeUpdate(value: value)
                        return
                    }
                    if let value = try? container.decode(ImageWireframeUpdate.self) {
                        self = .imageWireframeUpdate(value: value)
                        return
                    }
                    if let value = try? container.decode(PlaceholderWireframeUpdate.self) {
                        self = .placeholderWireframeUpdate(value: value)
                        return
                    }
                    if let value = try? container.decode(WebviewWireframeUpdate.self) {
                        self = .webviewWireframeUpdate(value: value)
                        return
                    }
                    let error = DecodingError.Context(
                        codingPath: container.codingPath,
                        debugDescription: """
                        Failed to decode `Updates`.
                        Ran out of possibilities when trying to decode the value of associated type.
                        """
                    )
                    throw DecodingError.typeMismatch(Updates.self, error)
                }

                /// Schema of all properties of a TextWireframeUpdate.
                @_spi(Internal)
                public struct TextWireframeUpdate: Codable {
                    /// The border properties of this wireframe. The default value is null (no-border).
                    public let border: SRShapeBorder?

                    /// Schema of clipping information for a Wireframe.
                    public let clip: SRContentClip?

                    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
                    public let height: Int64?

                    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
                    public let id: Int64

                    /// The style of this wireframe.
                    public let shapeStyle: SRShapeStyle?

                    /// The text value of the wireframe.
                    public var text: String?

                    /// Schema of all properties of a TextPosition.
                    public let textPosition: SRTextPosition?

                    /// Schema of all properties of a TextStyle.
                    public let textStyle: SRTextStyle?

                    /// The type of the wireframe.
                    public let type: String = "text"

                    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
                    public let width: Int64?

                    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let x: Int64?

                    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let y: Int64?

                    enum CodingKeys: String, CodingKey {
                        case border = "border"
                        case clip = "clip"
                        case height = "height"
                        case id = "id"
                        case shapeStyle = "shapeStyle"
                        case text = "text"
                        case textPosition = "textPosition"
                        case textStyle = "textStyle"
                        case type = "type"
                        case width = "width"
                        case x = "x"
                        case y = "y"
                    }
                }

                /// Schema of a ShapeWireframeUpdate.
                @_spi(Internal)
                public struct ShapeWireframeUpdate: Codable {
                    /// The border properties of this wireframe. The default value is null (no-border).
                    public let border: SRShapeBorder?

                    /// Schema of clipping information for a Wireframe.
                    public let clip: SRContentClip?

                    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
                    public let height: Int64?

                    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
                    public let id: Int64

                    /// The style of this wireframe.
                    public let shapeStyle: SRShapeStyle?

                    /// The type of the wireframe.
                    public let type: String = "shape"

                    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
                    public let width: Int64?

                    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let x: Int64?

                    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let y: Int64?

                    enum CodingKeys: String, CodingKey {
                        case border = "border"
                        case clip = "clip"
                        case height = "height"
                        case id = "id"
                        case shapeStyle = "shapeStyle"
                        case type = "type"
                        case width = "width"
                        case x = "x"
                        case y = "y"
                    }
                }

                /// Schema of all properties of a ImageWireframeUpdate.
                @_spi(Internal)
                public struct ImageWireframeUpdate: Codable {
                    /// base64 representation of the image. Not required as the ImageWireframe can be initialised without any base64
                    public var base64: String?

                    /// The border properties of this wireframe. The default value is null (no-border).
                    public let border: SRShapeBorder?

                    /// Schema of clipping information for a Wireframe.
                    public let clip: SRContentClip?

                    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
                    public let height: Int64?

                    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
                    public let id: Int64

                    /// Flag describing an image wireframe that should render an empty state placeholder
                    public var isEmpty: Bool?

                    /// MIME type of the image file
                    public var mimeType: String?

                    /// Unique identifier of the image resource
                    public var resourceId: String?

                    /// The style of this wireframe.
                    public let shapeStyle: SRShapeStyle?

                    /// The type of the wireframe.
                    public let type: String = "image"

                    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
                    public let width: Int64?

                    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let x: Int64?

                    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let y: Int64?

                    enum CodingKeys: String, CodingKey {
                        case base64 = "base64"
                        case border = "border"
                        case clip = "clip"
                        case height = "height"
                        case id = "id"
                        case isEmpty = "isEmpty"
                        case mimeType = "mimeType"
                        case resourceId = "resourceId"
                        case shapeStyle = "shapeStyle"
                        case type = "type"
                        case width = "width"
                        case x = "x"
                        case y = "y"
                    }
                }

                /// Schema of all properties of a PlaceholderWireframe.
                @_spi(Internal)
                public struct PlaceholderWireframeUpdate: Codable {
                    /// Schema of clipping information for a Wireframe.
                    public let clip: SRContentClip?

                    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
                    public let height: Int64?

                    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
                    public let id: Int64

                    /// Label of the placeholder
                    public var label: String?

                    /// The type of the wireframe.
                    public let type: String = "placeholder"

                    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
                    public let width: Int64?

                    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let x: Int64?

                    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let y: Int64?

                    enum CodingKeys: String, CodingKey {
                        case clip = "clip"
                        case height = "height"
                        case id = "id"
                        case label = "label"
                        case type = "type"
                        case width = "width"
                        case x = "x"
                        case y = "y"
                    }
                }

                /// Schema of all properties of a WebviewWireframeUpdate.
                @_spi(Internal)
                public struct WebviewWireframeUpdate: Codable {
                    /// The border properties of this wireframe. The default value is null (no-border).
                    public let border: SRShapeBorder?

                    /// Schema of clipping information for a Wireframe.
                    public let clip: SRContentClip?

                    /// The height in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height of all UI elements is divided by 2 to get a normalized height.
                    public let height: Int64?

                    /// Defines the unique ID of the wireframe. This is persistent throughout the view lifetime.
                    public let id: Int64

                    /// Whether this web-view is visible or not.
                    public let isVisible: Bool?

                    /// The style of this wireframe.
                    public let shapeStyle: SRShapeStyle?

                    /// Unique Id of the slot containing this webview.
                    public let slotId: String

                    /// The type of the wireframe.
                    public let type: String = "webview"

                    /// The width in pixels of the UI element, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width of all UI elements is divided by 2 to get a normalized width.
                    public let width: Int64?

                    /// The position in pixels on X axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let x: Int64?

                    /// The position in pixels on Y axis of the UI element in absolute coordinates. The anchor point is always the top-left corner of the wireframe.
                    public let y: Int64?

                    enum CodingKeys: String, CodingKey {
                        case border = "border"
                        case clip = "clip"
                        case height = "height"
                        case id = "id"
                        case isVisible = "isVisible"
                        case shapeStyle = "shapeStyle"
                        case slotId = "slotId"
                        case type = "type"
                        case width = "width"
                        case x = "x"
                        case y = "y"
                    }
                }
            }
        }

        /// Schema of a TouchData.
        @_spi(Internal)
        public struct TouchData: Codable {
            /// Contains the positions of the finger on the screen during the touchDown/touchUp event lifecycle.
            public let positions: [Positions]?

            /// The source of this type of incremental data.
            public let source: Int64 = 2

            enum CodingKeys: String, CodingKey {
                case positions = "positions"
                case source = "source"
            }

            @_spi(Internal)
            public struct Positions: Codable {
                /// The touch id of the touch event this position corresponds to. In mobile it is possible to have multiple touch events (fingers touching the screen) happening at the same time.
                public let id: Int64

                /// The UTC timestamp in milliseconds corresponding to the moment the position change was recorded. Each timestamp is computed as the UTC interval since 00:00:00.000 01.01.1970.
                public let timestamp: Int64

                /// The x coordinate value of the position.
                public let x: Int64

                /// The y coordinate value of the position.
                public let y: Int64

                enum CodingKeys: String, CodingKey {
                    case id = "id"
                    case timestamp = "timestamp"
                    case x = "x"
                    case y = "y"
                }
            }
        }

        /// Schema of a ViewportResizeData.
        @_spi(Internal)
        public struct ViewportResizeData: Codable {
            /// The new height of the screen in pixels, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the height is divided by 2 to get a normalized height.
            public let height: Int64

            /// The source of this type of incremental data.
            public let source: Int64 = 4

            /// The new width of the screen in pixels, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the width is divided by 2 to get a normalized width.
            public let width: Int64

            enum CodingKeys: String, CodingKey {
                case height = "height"
                case source = "source"
                case width = "width"
            }
        }

        /// Schema of a PointerInteractionData.
        @_spi(Internal)
        public struct PointerInteractionData: Codable {
            /// Schema of an PointerEventType
            public let pointerEventType: PointerEventType

            /// Id of the pointer of this PointerInteraction.
            public let pointerId: Int64

            /// Schema of an PointerType
            public let pointerType: PointerType

            /// The source of this type of incremental data.
            public let source: Int64 = 9

            /// X-axis coordinate for this PointerInteraction.
            public let x: Double

            /// Y-axis coordinate for this PointerInteraction.
            public let y: Double

            enum CodingKeys: String, CodingKey {
                case pointerEventType = "pointerEventType"
                case pointerId = "pointerId"
                case pointerType = "pointerType"
                case source = "source"
                case x = "x"
                case y = "y"
            }

            /// Schema of an PointerEventType
            @_spi(Internal)
            public enum PointerEventType: String, Codable {
                case down = "down"
                case up = "up"
                case move = "move"
            }

            /// Schema of an PointerType
            @_spi(Internal)
            public enum PointerType: String, Codable {
                case mouse = "mouse"
                case touch = "touch"
                case pen = "pen"
            }
        }
    }
}

/// Schema of a Record which contains the screen properties.
@_spi(Internal)
public struct SRMetaRecord: Codable {
    /// The data contained by this record.
    public let data: Data

    /// Unique ID of the slot that generated this record.
    public let slotId: String?

    /// Defines the UTC time in milliseconds when this Record was performed.
    public let timestamp: Int64

    /// The type of this Record.
    public let type: Int64 = 4

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case slotId = "slotId"
        case timestamp = "timestamp"
        case type = "type"
    }

    /// The data contained by this record.
    @_spi(Internal)
    public struct Data: Codable {
        /// The height of the screen in pixels, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the normalized height is the current height divided by 2.
        public let height: Int64

        /// Browser-specific. URL of the view described by this record.
        public let href: String?

        /// The width of the screen in pixels, normalized based on the device pixels per inch density (DPI). Example: if a device has a DPI = 2, the normalized width is the current width divided by 2.
        public let width: Int64

        enum CodingKeys: String, CodingKey {
            case height = "height"
            case href = "href"
            case width = "width"
        }
    }
}

/// Schema of a Record type which contains focus information.
@_spi(Internal)
public struct SRFocusRecord: Codable {
    public let data: Data

    /// Unique ID of the slot that generated this record.
    public let slotId: String?

    /// Defines the UTC time in milliseconds when this Record was performed.
    public let timestamp: Int64

    /// The type of this Record.
    public let type: Int64 = 6

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case slotId = "slotId"
        case timestamp = "timestamp"
        case type = "type"
    }

    @_spi(Internal)
    public struct Data: Codable {
        /// Whether this screen has a focus or not. For now it will always be true for mobile.
        public let hasFocus: Bool

        enum CodingKeys: String, CodingKey {
            case hasFocus = "has_focus"
        }
    }
}

/// Schema of a Record which signifies that view lifecycle ended.
@_spi(Internal)
public struct SRViewEndRecord: Codable {
    /// Unique ID of the slot that generated this record.
    public let slotId: String?

    /// Defines the UTC time in milliseconds when this Record was performed.
    public let timestamp: Int64

    /// The type of this Record.
    public let type: Int64 = 7

    enum CodingKeys: String, CodingKey {
        case slotId = "slotId"
        case timestamp = "timestamp"
        case type = "type"
    }
}

/// Schema of a Record which signifies that the viewport properties have changed.
@_spi(Internal)
public struct SRVisualViewportRecord: Codable {
    public let data: Data

    /// Unique ID of the slot that generated this record.
    public let slotId: String?

    /// Defines the UTC time in milliseconds when this Record was performed.
    public let timestamp: Int64

    /// The type of this Record.
    public let type: Int64 = 8

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case slotId = "slotId"
        case timestamp = "timestamp"
        case type = "type"
    }

    @_spi(Internal)
    public struct Data: Codable {
        public let height: Double

        public let offsetLeft: Double

        public let offsetTop: Double

        public let pageLeft: Double

        public let pageTop: Double

        public let scale: Double

        public let width: Double

        enum CodingKeys: String, CodingKey {
            case height = "height"
            case offsetLeft = "offsetLeft"
            case offsetTop = "offsetTop"
            case pageLeft = "pageLeft"
            case pageTop = "pageTop"
            case scale = "scale"
            case width = "width"
        }
    }
}

/// Mobile-specific. Schema of a Session Replay Record.
@_spi(Internal)
public enum SRRecord: Codable {
    case fullSnapshotRecord(value: SRFullSnapshotRecord)
    case incrementalSnapshotRecord(value: SRIncrementalSnapshotRecord)
    case metaRecord(value: SRMetaRecord)
    case focusRecord(value: SRFocusRecord)
    case viewEndRecord(value: SRViewEndRecord)
    case visualViewportRecord(value: SRVisualViewportRecord)

    // MARK: - Codable

    public func encode(to encoder: Encoder) throws {
        // Encode only the associated value, without encoding enum case
        var container = encoder.singleValueContainer()

        switch self {
        case .fullSnapshotRecord(let value):
            try container.encode(value)
        case .incrementalSnapshotRecord(let value):
            try container.encode(value)
        case .metaRecord(let value):
            try container.encode(value)
        case .focusRecord(let value):
            try container.encode(value)
        case .viewEndRecord(let value):
            try container.encode(value)
        case .visualViewportRecord(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        // Decode enum case from associated value
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(SRFullSnapshotRecord.self) {
            self = .fullSnapshotRecord(value: value)
            return
        }
        if let value = try? container.decode(SRIncrementalSnapshotRecord.self) {
            self = .incrementalSnapshotRecord(value: value)
            return
        }
        if let value = try? container.decode(SRMetaRecord.self) {
            self = .metaRecord(value: value)
            return
        }
        if let value = try? container.decode(SRFocusRecord.self) {
            self = .focusRecord(value: value)
            return
        }
        if let value = try? container.decode(SRViewEndRecord.self) {
            self = .viewEndRecord(value: value)
            return
        }
        if let value = try? container.decode(SRVisualViewportRecord.self) {
            self = .visualViewportRecord(value: value)
            return
        }
        let error = DecodingError.Context(
            codingPath: container.codingPath,
            debugDescription: """
            Failed to decode `SRRecord`.
            Ran out of possibilities when trying to decode the value of associated type.
            """
        )
        throw DecodingError.typeMismatch(SRRecord.self, error)
    }
}
#endif
// Generated from https://github.com/DataDog/rum-events-format/tree/be033e3251da4a20891a774f9843c489a693c80d
