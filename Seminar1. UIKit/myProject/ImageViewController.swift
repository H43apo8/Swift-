//
//  ImageViewController.swift
//  myProject
//
//  Created by Максим Бобков on 11.01.2024.
//

import UIKit

// Контроллер для отображения картинки по центру экрана

final class ImageViewController: UIViewController {
    
    private var myImage = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
        
        setupUI()
        addConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            // В кложурах мы обращаемся к объектам только через self
            self.myImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.myImage.transform = CGAffineTransform(rotationAngle: 45)
        })
        
        UIView.animate(withDuration: 3, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.myImage.layer.opacity = 0
        })
    }
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        myImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        view.addSubview(myImage)
    }
    
    private func addConstraints() {
        
        myImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myImage.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            myImage.heightAnchor.constraint(equalTo: myImage.widthAnchor)
        ])
    }
}
