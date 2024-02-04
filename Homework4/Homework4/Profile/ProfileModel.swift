//
//  ProfileModel.swift
//  Homework4
//
//  Created by Максим Бобков on 26.01.2024.
//

/*
{
    "response": {
        "id": 701404481,
        "home_town": "",
        "status": "",
        "photo_200": "https://pp.userapi.com/Dmv0wY39OeY4tHbvPfCmutXa0aM067BOoA-CDg/T0VPiJdsric.png",
        "is_service_account": false,
        "bdate": "7.5.1978",
        "verification_status": "unverified",
        "promo_verifications": [],
        "first_name": "Максим",
        "last_name": "Бобков",
        "bdate_visibility": 1,
        "phone": "+7 *** *** ** 25",
        "relation": 0,
        "screen_name": "biramax",
        "sex": 2
    }
}
*/

struct ProfileModel: Decodable {
    let response: Profile
}

struct Profile: Decodable {
    let firstName: String
    let lastName: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_200"
    }
}
