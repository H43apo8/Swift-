//
//  NetworkService.swift
//  myProject
//
//  Created by Максим Бобков on 15.01.2024.
//

import Foundation // Библиотека нужна, чтобы сделать запрос в сеть

final class NetworkService {
    
    // Стандартная сессия. Её можно использовать повсюду в классе. Можно создать собственную сессию под конкретный случай в конкретной функции.
    private let session = URLSession.shared
    
    //func task() { // Без параметров, чтобы просто вывести массив полученных городов (декодированных в JSON) в консоль через команду ниже print(towns)
    // @escaping - сбегающие замыкания - выполняются после завершения функции
    func task(completion: @escaping ([Town]) -> Void) {

        // Собственная сессия под конкретную задачу:
        // Создаем конфигурацию
        //let configuration = URLSessionConfiguration.default
        // Создаем сессиию
        //let session = URLSession(configuration: configuration)
        
        // URL запроса
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/locations/?lang=ru&fields=timezone,name,currency,coords") else {
            return
        }
        
        // Функция, которая на вход принимает два аргумента - url и кложуру.
        // Поскольку кложура является последним элементом, мы можем вынести её за пределы круглых скобок входных параметров.
        session.dataTask(with: url) { (data, _, networkError) in // response не нужен, поэтому ставим _
            
            // Проверяем, пришли ли к нам данные
            guard let data else {
                return
            }
            
            // Поскольку JSONDecoder может потерпеть неудачу, кладём его в do { try } catch { }
            do {
                
                // Преобразуем полученный json, чтобы структурированно вывести его в консоль.
                //let towns = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                // Декодируем полученный json в структуры swift - сохраняем их в towns с типом [Town] - это массив структур, описанных в отдельном файле Town
                let towns = try JSONDecoder().decode([Town].self, from: data)
                
                //print(towns)
                
                completion(towns)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Отдельное задание - обрабатываем полученную ошибку при запросе по URL
    func proccessError(errorCode: Int) {
        
        guard let url = URL(string: "https://http.cat/"+String(errorCode)) else {
            return
        }
        
        session.dataTask(with: url) { (data, _, _) in
            print(data ?? "")
        }.resume()
    }
    
    // Отдельное задание - получаем новости.
    func getNews() {
        
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?fields=publication_date,title,body_text&text_format=text&actual_only=true") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data else {
                return
            }
            
            do {
                let news = try JSONDecoder().decode(NewsResults.self, from: data)
                print(news)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Отдельное задание - получаем места.
    func getPlaces() {
        
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/places/") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data else {
                return
            }
            
            do {
                let places = try JSONDecoder().decode(PlacesResults.self, from: data)
                print(places)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    // Отдельное задание - получаем фильмы.
    func getMovies() {
        
        guard let url = URL(string: "https://kudago.com/public-api/v1.2/movies/?fields=site_url,title,body_text,country,year,imdb_rating") else {
            return
        }
        
        session.dataTask(with: url) { (data, _, networkError) in
            
            guard let data else {
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MoviesResults.self, from: data)
                print(movies)
            } catch {
                print(error)
            }
        }.resume()
    }
}
