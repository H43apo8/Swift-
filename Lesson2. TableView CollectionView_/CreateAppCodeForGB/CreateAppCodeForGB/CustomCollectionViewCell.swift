//
//  CustomCollectionViewCell.swift
//  CreateAppCodeForGB
//
//  Created by Анастасия Рябова on 07.08.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    private var imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        imageView.image = UIImage(systemName: "person")
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
