import Vapor
import VaporConsole

class SampleCommand: Command {

	override var name: String {
		return "sample:test"
	}

	override var help: String? {
		return "Sample command"
	}

	override var options: [InputOption] {
		return [
			InputOption("something", mode: .Optional, help: "Some option.", value: "else")
		]
	}

	override func handle() {
		self.comment("Hello")
	}

}
