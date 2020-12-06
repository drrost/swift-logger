//
//  CompositLogger.swift
//  
//
//  Created by Rostyslav Druzhchenko on 06.12.2020.
//

import Foundation

class CompositLogger: ILogger {

    private var loggers = [ILogger]()

    public init() {}

    public func log_f(_ message: String) {
        loggers.forEach { logger in
            logger.log_f(message)
        }
    }

    public func add(_ logger: ILogger) {
        loggers.append(logger)
    }

    // MARK: - ILogger

    public func log_e(_ message: String) {
        loggers.forEach { logger in
            logger.log_e(message)
        }
    }

    public func log_w(_ message: String) {
        loggers.forEach { logger in
            logger.log_w(message)
        }
    }

    public func log_i(_ message: String) {
        loggers.forEach { logger in
            logger.log_i(message)
        }
    }

    public func log_d(_ message: String) {
        loggers.forEach { logger in
            logger.log_d(message)
        }
    }

    public func log_t(_ message: String) {
        loggers.forEach { logger in
            logger.log_t(message)
        }
    }
}
