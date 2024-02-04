//
//  ViewController.swift
//  URLSession
//
//  Created by Максим Бобков on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func getData() {
        
        // url
        let url = URL(string: "https://kudago.com/public-api/v1.4/locations/?lang=ru&fields=name,coords")
        
        // Создаем конфигурацию
        let configuration = URLSessionConfiguration.default
        
        // Создаем сессиию
        let session = URLSession(configuration: configuration)
        
        // Создаем задачу
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            // Преобразуем в json.
            // Когда мы используем try, мы обязательно должны использовать и do/catch. Но при использовании try! и try? не нужны do/catch.
            // При try? в случае ошибки мы получим nil
            // Если мы полностью уверены, что ошибки не возникнет, то можно использовать try!
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            
            // Выводим в консоль
            
            print("data:", data!) // Данные, возвращаемые сервером.
            print("response:", response!) // Объект, предоставляющий метаданные ответа, такие как заголовки HTTP и код состояния.
            print("error:", error ?? "") // Объект ошибки, указывающий, почему запрос не удался, или nil, если запрос был успешным.
            
            print("json:", json!)
            
            // Декодируем json
            
            do {
                let towns = try JSONDecoder().decode([Town].self, from: data!)
                print(towns)
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
    }
    
    // Маппинг json. Codable позволяет нам преобразовывать json в объекты языка Swift.
    // Создаём ниже структуры и даём им тип Codable.
    // Если мы будем использовать структуру только для декодировки ответа полученного от сервера, то мы можем вместо Codable указать Decodable. А если подразумевается, что структура будет использоваться только для кодировки и отправки на сервер, то можем указать только Encodable.
    
    struct Town: Codable {
        
        // Названия переменных должны совпадать с именами в json.
        // Если мы хотим использовать свои названия, то применяем CodingKeys.
        
        var townName: String // Имя города. Должно быть "name", но мы даём своё имя и используем CodingKeys.
        var coords: Coordinate // Координаты
        
        enum CodingKeys: String, CodingKey {
            case townName = "name" // Имя переменной в json
            case coords
        }
    }
    
    struct Coordinate: Codable {
        var lat: Double? // Широта
        var lon: Double? // Долгота
    }
}

