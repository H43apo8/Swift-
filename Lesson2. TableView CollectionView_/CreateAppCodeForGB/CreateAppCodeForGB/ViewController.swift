//
//  ViewController.swift
//  CreateAppCodeForGB
//
//  Created by Анастасия Рябова on 07.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Зелёный квадрат с текстом Hello
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.backgroundColor = .green
        label.textAlignment = .center
        return label
    }()
    
    // Иконка юзера
    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person"))
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    // Красная кнопка с текстом "Tap"
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Tap", for: .normal)
        return button
    }()
    
    // Создадим переменную scrollView.
    // lazy, поскольку мы пока не знаем габариты этой переменной.
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    // Создадим вычисляемое свойство для contentSize в scrollView.
    // Для этого создадим свойство contentSize с типом CGSize, в котором будет возвращаться CGSize, у которого ширина соответствует ширине основного вью, а высота соответствует двойной высоте основного вью.
    // Таким образом, фрейм scrollView у нас соответствует границам основного вью, а размер контента внутри scrollView больше в два раза по высоте.
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height * 2)
    }
    
    // Создадим contentView, которое расположим внутри scrollView в ф-и viewDidLoad.
    private lazy var contentView: UIView = {
        let contentView = UIView()
        // Размер contentView будет соответствовать contentSize.
        contentView.frame.size = contentSize
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Добавляем scrollView на основное вью.
        view.addSubview(scrollView)
        
        // contentView добавляем на scrollView
        scrollView.addSubview(contentView)
        
        // А остальные элементы, такие, как лейблы, кнопки, картинки и т.д. добавляем на contentView.
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(button)
        
        setupConstraints()
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}

private extension ViewController {
    @objc func tap() {
        navigationController?.pushViewController(NewViewController(), animated: true)
    }
}
