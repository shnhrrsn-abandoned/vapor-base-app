import Vapor
import VaporConsole
import libc

class LoggingProvider: Vapor.Provider, ConsoleProvider {

	func boot(application: Application) {
		if application.config.get("app.debug", false) {
			Log.enabledLevels = Log.Level.all
		} else {
			Log.enabledLevels = [ .Warning, .Error, .Fatal ]
		}
	}

	static func boot(console: Console) {
		Log.driver = Logger(console)
	}

}

private class Logger: LogDriver {
	private let console: Console

	private init(_ console: Console) {
		self.console = console
	}

	func log(level: Log.Level, message: String) {
		let date = time(nil)
		var message = "[\(date)] [\(level)] \(message)"

		switch(level) {
			case .Debug:
				message = "<comment>\(message)</comment>"
			case .Info:
				message = "<info>\(message)</info>"
			case .Warning, .Error, .Fatal:
				message = "<error>\(message)</error>"
			case .Verbose:
				fallthrough
			default:
				break
		}

		self.console.output.write(message)
	}

}
