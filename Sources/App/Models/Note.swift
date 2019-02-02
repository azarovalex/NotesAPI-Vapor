import FluentSQLite
import Vapor


final class Note: SQLiteModel {
    
    var id: Int?
    var title: String
    var content: String

    /// Creates a new `Todo`.
    init(id: Int? = nil, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Note: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Note: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Note: Parameter { }
