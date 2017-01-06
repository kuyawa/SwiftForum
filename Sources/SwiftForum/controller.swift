import Kitura
import KituraStencil
import LoggerAPI
import SwiftyJSON
import CloudFoundryEnv

public class Controller {

  let router: Router
  let appEnv: AppEnv

  var port: Int {
    get { return appEnv.port }
  }

  var url: String {
    get { return appEnv.url }
  }

  init() throws {
    appEnv = try CloudFoundryEnv.getAppEnv()

    router = Router()
	let stencil = StencilTemplateEngine(namespace: App.getStencilFilters())
	router.setDefault(templateEngine: stencil)

    // Static content from "public"
    router.all("/", middleware: StaticFileServer())

    // Routes
	router.get("/", handler: IndexHandler().index)
	router.get("/index", handler: IndexHandler().index)
	router.get("/test",  handler: TestHandler().show)
  }

}
