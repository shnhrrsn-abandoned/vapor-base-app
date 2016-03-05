import Vapor
import VaporStencil
import Stencil
import PathKit

class StencilProvider: Vapor.Provider {

	static func boot(application: Application) {
		View.renderers[".stencil"] = StencilRenderer()
	}

}

private class StencilRenderer: VaporStencil.StencilRenderer {

	override func render(template template: String, context: [String: Any]) throws -> String {
		let c = Context(dictionary: context)
		c["loader"] = TemplateLoader(paths: [Path(View.resourceDir + "/views")])

		let template = Template(templateString: template)
		return try template.render(c)
	}

}
