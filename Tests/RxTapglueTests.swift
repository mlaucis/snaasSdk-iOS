//
//  TapglueTests.swift
//  TapglueTests
//
//  Created by John Nilsen on 6/27/16.
//  Copyright © 2016 Tapglue. All rights reserved.
//

import XCTest
import RxSwift
import Mockingjay
import Nimble
@testable import Tapglue

class TapglueTests: XCTestCase {
    
    let configuration = Configuration()
    var tapglue: RxTapglue!
    let network = TestNetwork()
    
    var analyticsSent = false
    
    override func setUp() {
        super.setUp()
        stub(http(.POST, uri: "/0.4/analytics"), builder: http(204))
        
        tapglue = RxTapglue(configuration: Configuration())
        tapglue.network = network
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLoginUser() {
        var networkUser =  User()
        _ = tapglue.loginUser("paco", password: "1234").subscribeNext({ user in
            networkUser = user
        })
        expect(networkUser.id).toEventually(equal(network.testUserId))
    }
    
    func testRefreshCurrentUser() {
        var networkUser = User()
        _ = tapglue.refreshCurrentUser().subscribeNext { user in
            networkUser = user
        }
        expect(networkUser.id).toEventually(equal(network.testUserId))
    }

    func testCreateUser() {
        var createdUser = User()
        _ = tapglue.createUser(network.testUser).subscribeNext { user in
            createdUser = user
        }
        expect(createdUser.id).toEventually(equal(network.testUser.id))
    }

    func testUpdateUser() {
        var updatedUser = User()
        _ = tapglue.updateCurrentUser(network.testUser).subscribeNext { user in
            updatedUser = user
        }
        expect(updatedUser.id).to(equal(network.testUser.id))
    }

    func testLogout() {
        var wasLoggedout = false
        _ = tapglue.logout().subscribeCompleted { _ in
            wasLoggedout = true
        }
        expect(wasLoggedout).toEventually(beTruthy())
    }

    func testDeleteUser() {
        var wasDeleted = false
        _ = tapglue.deleteCurrentUser().subscribeCompleted { void in
            wasDeleted = true
        }
        expect(wasDeleted).toEventually(beTruthy())
    }

    func testRetrieveUser() {
        var networkUser = User()
        _ = tapglue.retrieveUser("1234").subscribeNext { user in
            networkUser = user
        }
        expect(networkUser.id).toEventually(equal(network.testUser.id))
    }

    func testRetrieveFollowers() {
        var networkFollowers = [User]()
        _ = tapglue.retrieveFollowers().subscribeNext { users in
            networkFollowers = users
        }
        expect(networkFollowers).to(contain(network.testUser))
    }
}

class TestNetwork: Network {
    
    
    let testUserId = "testUserId"
    let testUser: User
    
    override init() {
        testUser = User()
        testUser.id = testUserId
    }

    override func sendAnalytics() -> Observable<Void> {
        return Observable.create { observer in
            observer.on(.Completed)
            return NopDisposable.instance
        }
    }
    
    override func loginUser(username: String, password: String) -> Observable<User> {
        return Observable.just(testUser)
    }

    override func createUser(user: User) -> Observable<User> {
        return Observable.just(testUser)
    }
    
    override func refreshCurrentUser() -> Observable<User> {
        return Observable.just(testUser)
    }
    
    override func updateCurrentUser(user: User) -> Observable<User> {
        return Observable.just(testUser)
    }

    override func logout() -> Observable<Void> {
        return Observable.create { observer in
            observer.on(.Completed)
            return NopDisposable.instance
        }
    }

    override func deleteCurrentUser() -> Observable<Void> {
        return Observable.create { observer in
            observer.on(.Completed)
            return NopDisposable.instance
        }
    }

    override func retrieveUser(id: String) -> Observable<User> {
        return Observable.just(testUser)
    }

    override func retrieveFollowers() -> Observable<[User]> {
        return Observable.just([testUser])
    }
}