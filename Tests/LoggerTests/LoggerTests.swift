import XCTest
@testable import Logger

final class LoggerTests: XCTestCase {

    func testExample() {
        // Given
        let logger: ILogger = FileLogger("abc.log")

        // When
        logger.log_i("Test message")

        // Then
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
