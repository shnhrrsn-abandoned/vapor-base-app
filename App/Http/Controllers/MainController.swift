import Vapor

class MainController {

	func index(request: Request) throws -> ResponseConvertible {
		do {
			return try View(path: "welcome.stencil")
		} catch {
			Log.error("\(error)")
			return "Something went wrong."
		}
	}

	func json(request: Request) throws -> ResponseConvertible {
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

	func data(request: Request) throws -> ResponseConvertible {
		return try Json([
			"request.path": request.path,
			"request.data": "\(request.data)",
			"request.parameters": "\(request.parameters)",
		])
	}

	func session(request: Request) throws -> ResponseConvertible {
		let response: Response
		do {
			let json = try Json([
				"session.data": "\(request.session)",
				"request.cookies": "\(request.cookies)",
				"instructions": "Refresh to see cookie and session get set."
			]);
			response = try Response(status: .OK, json: json)
		} catch {
			response = Response(error: "Invalid JSON")
		}

		request.session?["name"] = "Vapor"
		response.cookies["test"] = "123"

		return response
	}

}
