//
//  UserDefaultsService.swift
//  myProject
//
//  Created by Максим Бобков on 25.01.2024.
//

import Foundation

final class UserDefaultsService {
    
    private var userDefaults = UserDefaults.standard
    
    func save(towns: [Town]) {
        
        for (i, town) in towns.enumerated() {
            userDefaults.set(town.name, forKey: "\(i)name")
            userDefaults.set(town.currency, forKey: "\(i)currency")
            userDefaults.set(town.timezone, forKey: "\(i)timezone")
            userDefaults.set(town.coords.lat, forKey: "\(i)lat")
            userDefaults.set(town.coords.lon, forKey: "\(i)lon")
        }
    }
    
    func get() -> [Town] {
        var towns: [Town] = []
        var i = 0
        var isExist: Bool = userDefaults.string(forKey: "\(i)name") != nil
        while isExist {
            towns.append(Town(
                name: userDefaults.string(forKey: "\(i)name") ?? "",
                timezone: userDefaults.string(forKey: "\(i)timezone") ?? "",
                coords: Coordinate(lat: userDefaults.double(forKey: "\(i)lat"),
                                   lon: userDefaults.double(forKey: "\(i)lon")),
                currency: userDefaults.string(forKey: "\(i)currency") ?? ""))
            i += 1
            isExist = userDefaults.string(forKey: "\(i)name") != nil
        }
        return towns
    }
}
