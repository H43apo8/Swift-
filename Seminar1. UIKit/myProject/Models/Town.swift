//
//  Town.swift
//  myProject
//
//  Created by Максим Бобков on 15.01.2024.
//

/* 
[{
    "name":"Екатеринбург",
    "timezone":"Asia/Yekaterinburg",
    "coords": {
        "lat":56.838606999999996,
        "lon":60.60551400000001
    },
    "currency":"RUB"
}]
*/

// Decodable - декодирование. Encodable - для кодирования. Codable - псевдоним для того и другого, но если мы точно значем, что будем делать, то лучше использовать Decodable или Encodable.
struct Town: Decodable {
    let name: String
    //let nameee: String?
    let timezone: String
    let coords: Coordinate
    let currency: String
}

struct Coordinate: Decodable {
    let lat: Double?
    let lon: Double?
}
