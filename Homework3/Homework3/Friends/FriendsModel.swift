//
//  FriendModel.swift
//  Homework3
//
//  Created by Максим Бобков on 23.01.2024.
//

/*
{
    "response": {
        "count": 2,
        "items": [
            {
                "id": 360129291,
                "track_code": "6a1efbeaV6-fLRIO7Q8uoDREYG2WJIr-u0oBS6IXEsx--kWujVU6xM0ZIg_vBi3xDcO1g2hI-eqiRhYlxmRN",
                "photo_50": "https://sun121-1.userapi.com/s/v1/ig2/s4SloOahAVCIUltpvId8ugRuAx1j8CefG1OsqTRPD0eOftQundi4guCF_pbl4bBSlbK_9P2PSCkYwrYPxc3t3M_h.jpg?size=50x50&quality=95&crop=318,1354,1206,1206&ava=1",
                "first_name": "Вероника",
                "last_name": "Мещан",
                "can_access_closed": true,
                "is_closed": false
            },
            {
                "id": 541366107,
                "track_code": "59145dedstVGcKF88qoR3stlNFD6IrNy4cqLf_62SiHZm69Wjk3fvhVBkCr0_UTR_OHouAROwGb4xpwRmsUV",
                "photo_50": "https://sun121-2.userapi.com/s/v1/if1/-a3thWgc_rwwpfN-7sMzCbI9puHA98Hbq5yVstxXG2vArOvMsExqcdvv3FaUb7UEhTOTYqHl.jpg?size=50x50&quality=96&crop=88,20,423,423&ava=1",
                "first_name": "Ирина",
                "last_name": "Бобкова",
                "can_access_closed": true,
                "is_closed": false
            }
        ]
    }
}
*/

struct FriendsModel: Decodable {
    let response: FriendsItems
}

struct FriendsItems: Decodable {
    let items: [Friend]
}

struct Friend: Decodable {
    let firstName: String
    let lastName: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
    }
}

