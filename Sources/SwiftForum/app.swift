import Kitura
import Stencil

class App {
	static func addStencilFilters() -> Namespace {
		let ns = Namespace()

		// Time
		ns.registerFilter("time") { value in 
			if let value = value as? String {
				return "Time: "+value
			}
			return value
		}

		// Timeago
		ns.registerFilter("timeago") { value in 
			if let value = value as? String {
				return "Just now: "+value
			}
			return value
		}

		// Plural
		ns.registerFilter("plural") { value in 
			if let value = value as? String {
				// if arguments.isEmpty { return value }
				// let word = arguments.first
				// if arguments.count == 1 {
				// 	if value == 1 { return "\(value) \(word)" }
				// 	else { return "\(value) \(word)s" }
				// } else {
				// 	let words = arguments[1]
				// 	if value == 1 { return "\(value) \(word)" }
				// 	else { return "\(value) \(words)" }
				// }
				return "Plural: \(value)"
        	}
			return value
		}

		return ns
	}
}

// End