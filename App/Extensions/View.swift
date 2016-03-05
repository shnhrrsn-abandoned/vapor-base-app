import Vapor

class View: Vapor.View {

	override init(path: String, context: [String: Any] = [:]) throws {
		try super.init(path: "views/" + path, context: context)
	}

}
