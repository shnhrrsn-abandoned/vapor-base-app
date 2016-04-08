import Vapor

class SampleMiddleware: Middleware {

    func respond(request: Request, chain: Responder) throws -> Response {
	    var request = request

		// You can manipulate the request before calling the chain
		// and abort early if necessary, a good injection point for
		// handling auth.

		// return Response(status: .Forbidden, text: "Permission denied")

	    var response = try chain.respond(request)

		// You can also manipulate the response to add headers
		// cookies, etc.

	    return response
	}

}
