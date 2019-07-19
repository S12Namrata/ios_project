//
//  Users.swift
//  ApiBasedApp
//
//  Created by Namrata on 05/06/2019.
//  Copyright © 2019 Namrata. All rights reserved.
//

import Foundation

struct RandomUser: Codable{
    let results:[UserInformation]
}

struct UserInformation: Codable{
    let gender: String
    let name: UserName
    let picture: PictureUrl
    let phone: String
    let cell: String
    let location: Location
    let email: String
    
}

struct UserName: Codable{
    let title: String
    let first: String
    let last: String
}


struct PictureUrl: Codable{
    let large: String
    let medium: String
    let thumbnail: String
}

struct Location: Codable {
    let street: String
    let city: String
    let state: String
    //let postcode: String
    //let postcode: Any
    let coordinates: Coordinates
    let timezone: TimeZone
}

struct Coordinates: Codable {
    let latitude: String
    let longitude: String
}

struct TimeZone: Codable {
    let offset: String
    let description: String
}
