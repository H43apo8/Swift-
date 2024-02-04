//
//  News.swift
//  myProject
//
//  Created by Максим Бобков on 15.01.2024.
//

/* 
{
 "count":712,
 "next":"https://kudago.com/public-api/v1.4/news/?actual_only=true&fields=publication_date%2Ctitle%2Cbody_text&page=2&text_format=text",
 "previous":null,
 "results": [
    {
        "publication_date":1705806007,
        "title":"Погода в Москве на 21 января 2024",
        "body_text":""
    },{
        "publication_date":1705719607,
        "title":"Погода в Москве на 20 января 2024",
        "body_text":""
    }]
}
*/

struct NewsResults: Decodable {
    let results: [News]
}

struct News: Decodable {
    let publicationDate: Int
    let title: String
    let bodyText: String
    
    enum CodingKeys: String, CodingKey {
        case publicationDate = "publication_date"
        case title
        case bodyText = "body_text"
    }
}


