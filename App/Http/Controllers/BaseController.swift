import Vapor

class BaseController: ApplicationInitializable {
	let app: Application

	required init(application: Application) {
		self.app = application
	}

}
