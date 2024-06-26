/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import Foundation

/// Interface that defines shared responibilities of HTTP header readers.
public protocol TracePropagationHeadersReader {
    func read() -> (
        traceID: TraceID,
        spanID: SpanID,
        parentSpanID: SpanID?
    )?

    /// Indicates whether the trace was sampled based on the provided headers.
    var sampled: Bool? { get }
}
