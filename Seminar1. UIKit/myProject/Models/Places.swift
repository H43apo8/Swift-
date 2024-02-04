//
//  Places.swift
//  myProject
//
//  Created by Максим Бобков on 15.01.2024.
//

struct PlacesResults: Decodable {
    let results: [Place]
}

struct Place: Decodable {
    let title: String
    let address: String
    let phone: String
}
