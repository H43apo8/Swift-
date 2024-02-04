//
//  UIImageView+Extensions.swift
//  myProject
//
//  Created by Максим Бобков on 15.01.2024.
//

import Foundation
import UIKit

// Расширяем UIImageView, чтобы оно само умело запрашивать картинку, без необходимости использовать класс NetworkService.

extension UIImageView {
    
    func getDogImage() {
        
        let session = URLSession.shared
        
        guard let url = URL(string: "https://random.dog/woof.json") else {
            return
        }
        
        // Получаем данные по данному url
        /*
        {
            "fileSizeBytes":1357590,
            "url":"https://random.dog/42e97d6a-c825-4191-9434-32cea191fc21.jpeg"
        }
        */
        session.dataTask(with: url) { (data, _, networkError) in
            
            // Пришли ли какие-нибудь данные?
            guard let data else {
                return
            }
            
            do {
                // Переводим в структуры полученный JSON
                let imageData = try JSONDecoder().decode(ImageModel.self, from: data)
                
                // Переводим полученный url картинки в URL-сущность языка свифт
                guard let imageUrl = URL(string: imageData.url) else {
                    return
                }
                
                // Снова запускаем запрос на получение самого изображения по данному урл
                session.dataTask(with: imageUrl) { (data, _, networkError) in
                    
                    // Проверяем, что пришли данные и что это действительно картинка
                    guard let data, let image = UIImage(data: data) else {
                        return
                    }
                    
                    // Поскольку при запросе к другому серверу система переключается на другую очередь, то вручную переводим на основную очередь.
                    DispatchQueue.main.async {
                        
                        // Обновляем картинку в нашем UIImageView
                        self.image = image
                    }
                    
                }.resume()
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
