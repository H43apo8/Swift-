//
//  PhotosViewController.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 19.01.2024.
//

import UIKit

final class PhotosViewController: UICollectionViewController {
    
    // Создаём объект NetworkService
    //private let networkService = NetworkService()
    // Чтобы не создавать каждый раз объект, сделал его методы статичными, т.к. нам в данном случае не нужны разные экземпляры NetworkService.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Photos"
        
        // Настраиваем переиспользование ячеек, чтобы система не создавала заново каждый раз новую ячейку, иначе будут проблемы с памятью. Система создаст новые ячейки для тех элементов, которые помещаются на экране и те, которые доступны при быстром скролле, а потом система начнёт переисползовать их для следующих ячеек.
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell") // Вместо "cell" можно любой набор символов
        
        // Запрашиваем фотографии
        NetworkService.getPhotos()
    }
    
    // Количество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    // Саму ячеку определяем в отдельном классе PhotoCell в отдельном файле
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Можно было бы написать просто PhotoCell(), но чтобы применить переиспользование ячеек пишем следующий код.
        // Проверяем, а точно ли ячейка, полученная через dequeueReusableCell, имеет нужный нам тип - PhotoCell.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}


// Устанавливаем размеры фотографий
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}
