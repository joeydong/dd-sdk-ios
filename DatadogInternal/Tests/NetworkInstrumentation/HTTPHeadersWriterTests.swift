/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-Present Datadog, Inc.
 */

import XCTest
import TestUtilities
import DatadogInternal

class HTTPHeadersWriterTests: XCTestCase {
    func testWritingSampledTraceContext_withAutoSamplingStrategy() {
        let writer = HTTPHeadersWriter(samplingStrategy: .headBased)

        writer.write(
            traceContext: .mockWith(
                traceID: .init(idHi: 1_234, idLo: 1_234),
                spanID: 2_345,
                isKept: true
            )
        )

        let headers = writer.traceHeaderFields
        XCTAssertEqual(headers[TracingHTTPHeaders.samplingPriorityField], "1")
        XCTAssertEqual(headers[TracingHTTPHeaders.traceIDField], "4d2")
        XCTAssertEqual(headers[TracingHTTPHeaders.parentSpanIDField], "929")
        XCTAssertEqual(headers[TracingHTTPHeaders.tagsField], "_dd.p.tid=4d2")
    }

    func testWritingDroppedTraceContext_withAutoSamplingStrategy() {
        let writer = HTTPHeadersWriter(samplingStrategy: .headBased)

        writer.write(
            traceContext: .mockWith(
                traceID: .init(idHi: 1_234, idLo: 1_234),
                spanID: 2_345,
                isKept: false
            )
        )

        let headers = writer.traceHeaderFields
        XCTAssertEqual(headers[TracingHTTPHeaders.samplingPriorityField], "0")
        XCTAssertNil(headers[TracingHTTPHeaders.traceIDField])
        XCTAssertNil(headers[TracingHTTPHeaders.parentSpanIDField])
        XCTAssertNil(headers[TracingHTTPHeaders.tagsField])
    }

    func testWritingSampledTraceContext_withCustomSamplingStrategy() {
        let writer = HTTPHeadersWriter(samplingStrategy: .custom(sampleRate: 100))

        writer.write(
            traceContext: .mockWith(
                traceID: .init(idHi: 1_234, idLo: 1_234),
                spanID: 2_345,
                isKept: .random()
            )
        )

        let headers = writer.traceHeaderFields
        XCTAssertEqual(headers[TracingHTTPHeaders.samplingPriorityField], "1")
        XCTAssertEqual(headers[TracingHTTPHeaders.traceIDField], "4d2")
        XCTAssertEqual(headers[TracingHTTPHeaders.parentSpanIDField], "929")
        XCTAssertEqual(headers[TracingHTTPHeaders.tagsField], "_dd.p.tid=4d2")
    }

    func testWritingDroppedTraceContext_withCustomSamplingStrategy() {
        let writer = HTTPHeadersWriter(samplingStrategy: .custom(sampleRate: 0))

        writer.write(
            traceContext: .mockWith(
                traceID: .init(idHi: 1_234, idLo: 1_234),
                spanID: 2_345,
                isKept: .random()
            )
        )

        let headers = writer.traceHeaderFields
        XCTAssertEqual(headers[TracingHTTPHeaders.samplingPriorityField], "0")
        XCTAssertNil(headers[TracingHTTPHeaders.traceIDField])
        XCTAssertNil(headers[TracingHTTPHeaders.parentSpanIDField])
        XCTAssertNil(headers[TracingHTTPHeaders.tagsField])
    }
}
