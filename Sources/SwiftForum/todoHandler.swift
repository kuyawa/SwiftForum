import Kitura
import LoggerAPI

class TodoHandler {
	func show(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
		defer { next() }

 		print("GET/todo route handler...")
		let data = ["test": "hello world"]

		do { try response.render("todo", context: data) }
	    catch { print(error) }
	}
}