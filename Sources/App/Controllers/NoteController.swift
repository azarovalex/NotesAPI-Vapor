import Vapor


final class NoteController {

    func index(_ req: Request) throws -> Future<[Note]> {
        return Note.query(on: req).all()
    }

    func create(_ req: Request) throws -> Future<Note> {
        return try req.content.decode(Note.self).flatMap { note in
            return note.save(on: req)
        }
    }


    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Note.self).flatMap { note in
            return note.delete(on: req)
        }.transform(to: .ok)
    }
}
