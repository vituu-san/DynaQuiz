//
//  DatabaseManager.swift
//  DynaQuiz
//
//  Created by Vitor Costa on 27/02/24.
//

import RealmSwift

protocol DatabaseProtocol: AnyObject {
    var realm: Realm { get set }

    func create<T: ObjectData>(_ object: T) throws
    func all<T: ObjectData>(of object: T.Type) throws -> Results<T>
    func getObject<T: ObjectData>(by id: ObjectId, type: T.Type) throws -> T?
    func update<T: ObjectData>(of object: T, type: T.Type, key: String, value: Any) throws
}

extension DatabaseProtocol {
    func create<T: ObjectData>(_ object: T) throws {
        try realm.write { realm.add(object) }
    }

    func all<T: ObjectData>(of object: T.Type) throws -> Results<T> {
        return realm.objects(T.self)
    }

    func getObject<T: ObjectData>(by id: ObjectId, type: T.Type) throws -> T? {
        let object = try all(of: type).first(where: { $0._id == id })
        return object
    }

    func update<T: ObjectData>(of object: T, type: T.Type, key: String, value: Any) throws {
        if let object = try getObject(by: object._id, type: type) {
            try realm.write { object.setValue(value, forKey: key) }
        }
    }
}

final class Database: DatabaseProtocol {
    var realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }
}
