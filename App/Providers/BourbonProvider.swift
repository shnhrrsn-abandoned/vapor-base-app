import Vapor
import VaporAssets

public class BourbonProvider: Vapor.Provider {

	public static func boot(application: Application) {
		guard let scss = Asset.compilers["scss"] as? ScssCompiler else {
			return
		}

		scss.includePaths.append(Application.workDir + "/bower_components/bourbon/app/assets/stylesheets")
	}

}
