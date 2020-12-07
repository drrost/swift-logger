//
//  FileLogger.swift
//  
//
//  Created by Rostyslav Druzhchenko on 06.12.2020.
//

import Foundation

class FileLogger: ILogger {

    private let path: String
    private let dateFormatter: DateFormatter

    public init(_ name: String) {
        path = FileLogger.resolvePath(name)
        dateFormatter = FileLogger.createDateFormatter()
    }

    func log_f(_ message: String) {
        write(formatMessage(.failure, message))
    }

    func log_e(_ message: String) {
        write(formatMessage(.error, message))
    }

    func log_w(_ message: String) {
        write(formatMessage(.warning, message))
    }

    func log_i(_ message: String) {
        write(formatMessage(.info, message))
    }

    func log_d(_ message: String) {
        write(formatMessage(.debug, message))
    }

    func log_t(_ message: String) {
        write(formatMessage(.trace, message))
    }
}

private extension FileLogger {

    private static func resolvePath(_ name: String) -> String {
        #if targetEnvironment(simulator)
        return "/tmp/" + name
        #elseif targetEnvironment(macCatalyst)
        return "/tmp/" + name
        #else
        print("iOS")
        return name
        #endif
    }

    private static func createDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS ZZZ"
        return dateFormatter
    }

    private func write(_ message: String) {

        guard let handle = openOrCreate() else { return }

        handle.seekToEndOfFile()
        if let data = message.data(using: .utf8) {
            handle.write(data)
        }
        try? handle.close()
    }

    private func openOrCreate() -> FileHandle? {

        if !FileManager.default.fileExists(atPath: path) {
            FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        }

        return FileHandle(forWritingAtPath: path)
    }

    func formatMessage(_ type: LogType, _ message: String) -> String {
        let date = dateFormatter.string(from: Date())
        return date + " " + type.rawValue + " " + message + "\n"
    }
}
