//
//  NetworkService.swift
//  CreateAppCodeForGB
//
//  Created by Максим Бобков on 18.01.2024.
//

import Foundation // Библиотека нужна, чтобы сделать запрос в сеть

final class NetworkService {
    
    weak var delegate: NetworkServiceDelegate?
    
    func getData() {
        
        // url
        let url = URL(string: "https://kudago.com/public-api/v1.4/locations/?lang=ru&fields=name,coords")
        
        // Создаем конфигурацию
        let configuration = URLSessionConfiguration.default
        
        // Создаем сессиию
        let session = URLSession(configuration: configuration)
        
        // Создаем задачу
        let _ = session.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            // Декодируем json
            do {
                let towns = try JSONDecoder().decode([Town].self, from: data)
                print(towns)
                self.delegate?.updateData(towns: towns)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    // Маппинг json. Codable позволяет нам преобразовывать json в объекты языка Swift.
    // Создаём ниже структуры и даём им тип Codable.
    // Если мы будем использовать структуру только для декодировки ответа полученного от сервера, то мы можем вместо Codable указать Decodable. А если подразумевается, что структура будет использоваться только для кодировки и отправки на сервер, то можем указать только Encodable.
}



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



// Делегирование - это шаблон проектирования, который позволяет классу передавать или «делегировать» некоторые из своих обязанностей другому классу.
// Реализацию ф-ий предусматриваем в расширении к классу NewViewController, поскольку мы именно там хотим отображать полученные с другого сайта данные.
protocol NetworkServiceDelegate: AnyObject {
    func updateData(towns: [Town])
}
