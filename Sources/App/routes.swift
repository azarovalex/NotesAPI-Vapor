import Vapor

public func routes(_ router: Router) throws {
    
    router.get { req in
        return "It works!"
    }

    let todoController = NoteController()
    router.get("notes", use: todoController.index)
    router.post("notes", use: todoController.create)
    router.delete("notes", Note.parameter, use: todoController.delete)
}
