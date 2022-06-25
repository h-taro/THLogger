import Foundation

public struct THLogger {
    public enum LogLevel: String {
        case debug
        case info
        case warning
        case error
    }
    
    public static func debug(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        for message in messages {
            printToConsole(
                level: .debug,
                message: message,
                file: file,
                function: function,
                line: line
            )
        }
    }
    
    public static func info(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        for message in messages {
            printToConsole(
                level: .info,
                message: message,
                file: file,
                function: function,
                line: line
            )
        }
    }
    
    public static func warning(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        for message in messages {
            printToConsole(
                level: .warning,
                message: message,
                file: file,
                function: function,
                line: line
            )
        }
    }
    
    public static func error(
        _ messages: Any...,
        file: String = #file,
        function: String = #function,
        line: Int = #line
    ) {
        for message in messages {
            printToConsole(
                level: .error,
                message: message,
                file: file,
                function: function,
                line: line
            )
        }
    }
}

extension THLogger {
    private static func getClassName(from filePath: String) -> String {
        guard let fileName = filePath.components(separatedBy: "/").last else {
            return ""
        }
        
        return fileName.components(separatedBy: ".").first ?? ""
    }
    
    private static func printToConsole(
        level: LogLevel,
        message: Any,
        file: String,
        function: String,
        line: Int
    ) {
        #if !RELEASE
        print("[\(level.rawValue.uppercased()) \(getClassName(from: file)).\(function) \(line): \(message)]")
        #endif
    }
}
