// SwiftForum

import Foundation
import Kitura
import LoggerAPI
import HeliumLogger
import CloudFoundryEnv
import CloudFoundryDeploymentTracker

do {
	print("Kitura starting...")

	// HeliumLogger disables all buffering on stdout
	//HeliumLogger.use(LoggerMessageType.info)
	HeliumLogger.use()

	let controller = try Controller()
	Log.info("Server will be started on '\(controller.url)'.")
	CloudFoundryDeploymentTracker(repositoryURL: "https://github.com/kuyawa/SwiftForum.git", codeVersion: nil).track()
	Kitura.addHTTPServer(onPort: controller.port, with: controller.router)
	Kitura.run()

} catch let error {

	Log.error(error.localizedDescription)
	Log.error("Oops... something went wrong. Server did not start!")

}

// End