import Vapor
import VaporStencil
import Stencil
import PathKit

class StencilProvider: Vapor.Provider {

	static func boot(application: Application) {
		if View.renderers[".stencil"] != nil {
			return
		}

		let renderer = StencilRenderer(templateLoader: TemplateLoader(paths: [Path(View.resourceDir + "/views")]))
		View.renderers[".stencil"] = renderer
	}

}
