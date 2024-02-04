//
//  NewsModel.swift
//  Homework5. SwiftUI
//
//  Created by Максим Бобков on 31.01.2024.
//

/*
{
    "count": 739,
    "next": "https://kudago.com/public-api/v1.4/news/?actual_only=true&fields=id%2Ctitle%2Cpublication_date&page=2&text_format=text",
    "previous": null,
    "results": [
         {
           "id": 48747,
           "publication_date": 1706713702,
           "title": "В Смольном объяснили, почему для метро не покупают поезда со сквозным проходом"
         },
         {
           "id": 48746,
           "publication_date": 1706712490,
           "title": "Стало известно, сколько мужчин находятся в декретном отпуске в Петербурге и Ленобласти"
         }
    ]
}
*/

struct NewsModel: Decodable {
    let results: [News]
}

struct News: Decodable, Identifiable {
    let id: Int
    let date: Double
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "publication_date"
        case title
    }
}
