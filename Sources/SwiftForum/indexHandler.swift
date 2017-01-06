import Kitura
import LoggerAPI
import HeliumLogger

class IndexHandler {
	func index(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
		defer { next() }
		HeliumLogger.use()
 		print("GET - /index route handler...")
 		Log.debug("?GET - /index route handler...")

 		let info:[String:Any] = [
 			"forum": [
 				"name": "Sephora - Forums in Swift",
 				"title": "Join Swift enthusiasts all around the world"
 			],
 			"stats": [
 				"users"    :  75,
 				"threads"  : 365,
 				"replies"  : 984,
 				"questions": 123,
 				"answered" :  88
 			],
 			"user": [
 				"isLogged": false,
 				"nick": "kuyawa",
 				"name": "Kuyawa Kata",
 				"avatar": "kuyawa.png"
 			]
 		]

 		let data:[String:Any] = [
 			"$sys": info,
 			"forum": [
 				"name": "Latest Posts",
 				"descrip": "From all forums"
 			],
 			"posts": [],
 			"test": "hello world"
 		]

 		print("Index template")

		//let environment = Environment(bundle: [Bundle.main])
		//let template = environment.loadTemplate(name: "sidebar.html")

		do { try response.render("index", context: data) }
	    catch { print(error) }
	}
}