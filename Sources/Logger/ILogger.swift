//
//  ILogger.swift
//  
//
//  Created by Rostyslav Druzhchenko on 06.12.2020.
//

import Foundation

public protocol ILogger {

    func log_f(_ message: String)
    func log_e(_ message: String)
    func log_w(_ message: String)
    func log_i(_ message: String)
    func log_d(_ message: String)
    func log_t(_ message: String)
}

enum LogType: String {
    case failure = "FAILURE"
    case error = "ERROR"
    case warning = "WARNING"
    case info = "INFO"
    case debug = "DEBUG"
    case trace = "TRACE"
}
