//
//  User.swift
//  Tapglue
//
//  Created by John Nilsen on 7/5/16.
//  Copyright © 2016 Tapglue. All rights reserved.
//

import ObjectMapper

public class User: Mappable {
    public var username: String?
    public var email: String?
    public var firstName: String?
    public var lastName: String?
    public var followedCount: Int?
    public var followerCount: Int?
    public var friendCount: Int?
    public var id: String?
    public var isFriend: Bool?
    public var isFollowed: Bool?
    public var isFollowing: Bool?
    public var sessionToken: String?
    public var updatedAt: String?
    
    init() {
        
    }
    
    required public init?(_ map: Map) {
        
    }
    
    public func mapping(map: Map) {
        username    <- map["user_name"]
        email       <- map["email"]
        firstName   <- map["first_name"]
        lastName    <- map["last_name"]
        followedCount   <- map["followed_count"]
        followerCount   <- map["follower_count"]
        friendCount <- map["friend_count"]
        id          <- map ["id_string"]
        isFriend    <- map["is_friend"]
        isFollowed  <- map["is_followed"]
        isFollowing <- map["is_following"]
        sessionToken    <- map["session_token"]
        updatedAt   <- map["updated_at"]
    }
    
}