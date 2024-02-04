//
//  NetworkService.swift
//  Homework3
//
//  Created by Максим Бобков on 23.01.2024.
//

import Foundation

final class NetworkService {
    
    static let session = URLSession.shared
    
    // Access token, выданный VK.
    static var token = ""
    //static var userID = ""
    
    // Запрашиваем список друзей.
    static func getFriends() {
        
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=" + NetworkService.token + "&fields=photo_50&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data else {
                return
            }
            
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                
                // Выводим в консоль
                print(friends)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Запрашиваем список групп (сообществ).
    static func getGroups() {
        
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=" + NetworkService.token + "&extended=1&fields=description&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data else {
                return
            }
            
            do {
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                
                // Выводим в консоль
                print(groups)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Запрашиваем фото.
    static func getPhotos() {
        
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=" + NetworkService.token + "&album_id=wall&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data else {
                return
            }
            
            do {
                let photos = try JSONDecoder().decode(PhotosModel.self, from: data)
                
                // Выводим в консоль
                print(photos)
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
