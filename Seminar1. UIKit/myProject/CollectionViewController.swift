//
//  CollectionViewController.swift
//  myProject
//
//  Created by Максим Бобков on 11.01.2024.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        collectionView.backgroundColor = Theme.currentTheme.backgroundColor
        //collectionView.backgroundColor = UIColor(red: 0.4353337288, green: 0.7163901925, blue: 0.9201350212, alpha: 1)
        
        // Настраиваем переиспользование ячеек, чтобы система не создавала заново каждый раз новую ячейку, иначе будут проблемы с памятью. Система создаст новые ячейки для тех элементов, которые помещаются на экране и те, которые доступны при быстром скролле, а потом система начнёт переисползовать их для следующих ячеек.
        collectionView.register(CustomCollectionNewCell.self, forCellWithReuseIdentifier: "cell") // Вместо "cell" можно любой набор символов
    }
    
    // Количество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    // Саму ячеку определяем в отдельном классе CustomCollectionNewCell в отдельном файле
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Можно было бы написать просто CustomCollectionNewCell(), но чтобы применить переиспользование ячеек пишем следующий код:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Проверяем, а точно ли ячейка, полученная выше через dequeueReusableCell, имеет нужный нам тип - CustomCollectionNewCell.
        guard let cell = cell as? CustomCollectionNewCell else {
            return UICollectionViewCell()
        }
        
        // Задаём поведение при тапе на ячейке - переходим к контроллеру ImageViewController
        cell.tapOnCell = { [weak self] image in
            // Пишем self, т.к. мы захватываем navigationController сильной ссылкой.
            // Чтобы не было цикла сильных ссылок, выставляем выше weak.
            
            let animation = CATransition()
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.type = .fade
            animation.duration = 2
            self?.navigationController?.view.layer.add(animation, forKey: nil)
            self?.navigationController?.pushViewController(ImageViewController(image: image), animated: false)
        }
        
        return cell
    }
}

