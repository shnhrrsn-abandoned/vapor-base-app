import Vapor

class MainController: BaseController {

	func index(request: Request) throws -> ResponseRepresentable {
		do {
			return try self.app.view("welcome.stencil")
		} catch {
			Log.error("\(error)")
			return "Something went wrong."
		}
	}

	func json(request: Request) throws -> ResponseRepresentable {
		return Json([
			"number": 123,
			"string": "test",
			"array": [
				0, 1, 2, 3
			],
			"dict": [
				"name": "Vapor",
				"lang": "Swift"
			]
		])
	}

	func data(request: Request) throws -> ResponseRepresentable {
		return Json([
			"request.path": request.uri.path ?? "null",
			"request.data": "\(request.data)",
			"request.parameters": "\(request.parameters)",
		])
	}

	func session(request: Request) throws -> ResponseRepresentable {
		let json = Json([
			"session.data": "\(request.session)",
			"request.cookies": "\(request.cookies)",
			"instructions": "Refresh to see cookie and session get set."
		])

		var response = Response(status: .ok, json: json)

		request.session?["name"] = "Vapor"
		response.cookies["test"] = "123"

		return response
	}

}
