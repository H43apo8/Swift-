//
//  NextViewController.swift
//  myProject
//
//  Created by Максим Бобков on 25.12.2023.
//

import UIKit

// Если не планируются наследники, то делаем класс final
final class NextViewController: UIViewController {
    
    private var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    private var view4: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    private var view5: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    private var view6: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // У UIViewController есть свойство view - это представление, которым управляет контроллер, по умолчанию оно расположено на весь экран.
        view.backgroundColor = Theme.currentTheme.backgroundColor
        
        // Заголовок для экрана
        title = "Next ViewController"
        
        // Заголовок для меню (если не установлен, берётся как заголовок от экрана)
        tabBarItem.title = "NextVC"
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        view.addSubview(view6)
        addConstraints()
    }
    
    private func addConstraints() {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false
        view6.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            view1.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            view1.heightAnchor.constraint(equalToConstant: view.frame.size.width/3),
            view1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            
            view2.topAnchor.constraint(equalTo: view1.topAnchor),
            view2.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view2.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view2.leftAnchor.constraint(equalTo: view1.rightAnchor, constant: 10),
            
            view3.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10),
            view3.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view3.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view3.leftAnchor.constraint(equalTo: view1.leftAnchor),
            
            view4.topAnchor.constraint(equalTo: view3.topAnchor),
            view4.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view4.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view4.leftAnchor.constraint(equalTo: view2.leftAnchor),
            
            view5.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 10),
            view5.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view5.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view5.leftAnchor.constraint(equalTo: view1.leftAnchor),
            
            view6.topAnchor.constraint(equalTo: view5.topAnchor),
            view6.widthAnchor.constraint(equalTo: view1.widthAnchor),
            view6.heightAnchor.constraint(equalTo: view1.heightAnchor),
            view6.leftAnchor.constraint(equalTo: view2.leftAnchor),
        ])
    }
}

// Чтобы сбоку интерактивно отображалась визуализация контроллера
#Preview {
    NextViewController()
}
