import Vapor

class Routes {

	class func register(app: Application) {
		let main = MainController(application: app)

		app.get("/", handler: main.index)
		app.get("json", handler: main.json)
		app.get("data/:id", handler: main.data)
		app.get("session", handler: main.session)
	}

}
