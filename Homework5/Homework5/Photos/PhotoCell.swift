//
//  PhotoCell.swift
//  Homework1. UIKit
//
//  Created by Максим Бобков on 20.01.2024.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    // Каждая ячейка будет представлять из себя картинку, ставим пока системную иконку юзера
    private var cellImage = UIImageView(image: UIImage(systemName: "person"))
    
    override init(frame: CGRect) { // CGRect - это тип, который позволяет выстроить X, Y, ширину и высоту
        
        super.init(frame: frame)
        
        setupUI()
        addConstraints()
    }
    
    // Обязательный инициализатор
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // После получения данных с сервера ВК обновляем картинки
    func updateCell(photo: Photo) {
               
        // Поскольку мы будем получать данные по урл (через try? Data), мы должны предварительно вручную встать на другой поток (в глобальную очередь), а потом также вручную вернуться обратно на главный поток (в основную очередь)
        DispatchQueue.global().async {
            
            // Проверяем урл картинки и следом получаем саму картинку по этому урл через try? Data
            if let url = URL(string: photo.sizes[2].url), let image = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.cellImage.image = UIImage(data: image)
                }
            }
        }
    }
    
    private func setupUI() {
        contentView.addSubview(cellImage)
    }
    
    private func addConstraints() {
        
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Растягиваем картинку на всю ширину и высоту ячейки
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImage.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
    }
}
