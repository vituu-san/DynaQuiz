//
//  DatabaseTests.swift
//  DynaQuizTests
//
//  Created by Vitor Costa on 27/02/24.
//

import XCTest
import RealmSwift

@testable import DynaQuiz

final class DatabaseTests: XCTestCase {
    var sut: Database!
    var testRealm: Realm!

    override func setUp() {
        testRealm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "dynamox-quiz"))
        sut = Database(realm: testRealm)
    }

    override func tearDown() {
        try! testRealm.write {
            testRealm.deleteAll()
        }
        testRealm = nil
        sut = nil
    }

    func testCreate_ShouldSaveObject() {
        let user = User(name: "John", score: 7)
        try! sut.create(user)

        XCTAssertEqual(testRealm.objects(User.self).first ?? .placeholder, user)
    }

    func testAll_ShouldRetrieveAllObjects() {
        let john = User(name: "John", score: 7)
        let sara = User(name: "Sara", score: 9)

        try! testRealm.write {
            testRealm.add(john)
            testRealm.add(sara)
        }

        let users = try! sut.all(of: User.self)

        XCTAssertEqual(users.count, 2)
    }
}
