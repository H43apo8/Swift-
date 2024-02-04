//
//  GroupModel.swift
//  Homework3
//
//  Created by Максим Бобков on 23.01.2024.
//

/*
 {
     "response": {
         "count": 1,
         "items": [
             {
                 "id": 125461266,
                 "description": "Лаборатория PHYT’S (Франция) – мировой лидер по производству 100 % натуральной профессиональной косметики, качество которой соответствует одному из самых строгих международных стандартов – BIO. \nНа протяжении 50 лет специалисты Лаборатории разрабатывают инновационные формулы, рецептуры органических средств, профессиональные программы, массажные техники. В основе уникальных рецептов косметических препаратов PHYT'S, дарящих коже красоту и здоровье, - растительные и минеральные компоненты, которые проходят тщательный отбор и бережную очистку. \n\nПродукция компании поставляется в салоны красоты и спа 47 стран мира. Профессиональное направление PHYT’S представлено в 3500 салонах Франции. Такая популярность стала возможной благодаря высокой эффективности и безопасности марки!",
                 "name": "PHYT'S_RUSSIA",
                 "screen_name": "phyts_russia",
                 "is_closed": 0,
                 "type": "group",
                 "photo_50": "https://sun58-2.userapi.com/s/v1/if1/D89Sp0o4PO5Yyp9l9rEWm1LCqKKkg92h5VvxIv8WJsc5ErnOml2moxnGWaltAJmhSsQRvSSh.jpg?size=50x50&quality=96&crop=0,0,500,500&ava=1",
                 "photo_100": "https://sun58-2.userapi.com/s/v1/if1/22ZXwSnRI35wrqdnOtXJ6wA6NF4-DctiG3nYYsC-zXPCxqRzPkOq4XZl8HnM-zSLD4_ZqvX2.jpg?size=100x100&quality=96&crop=0,0,500,500&ava=1",
                 "photo_200": "https://sun58-2.userapi.com/s/v1/if1/Uxyzl1fu3fOkxBLaj03XbhHY2tbJeb_exdNvp7PwKM9-tq_PBkhZJNDxlDzeO2kXiUe44GHT.jpg?size=200x200&quality=96&crop=0,0,500,500&ava=1"
             }
         ],
         "last_updated_time": 1706035641
     }
 } 
 */

struct GroupsModel: Decodable {
    let response: GroupsItems
}

struct GroupsItems: Decodable {
    let items: [Group]
}

struct Group: Decodable {
    let name: String
    let description: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case photo = "photo_50"
    }
}
