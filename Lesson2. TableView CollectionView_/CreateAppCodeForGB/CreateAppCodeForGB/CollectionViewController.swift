//
//  CollectionViewController.swift
//  CreateAppCodeForGB
//
//  Created by Анастасия Рябова on 07.08.2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
//    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CollectionView"
        view.backgroundColor = .white
        
//        view.addSubview(collectionView)
//        setupConstraints()

//        collectionView.dataSource = self
//        collectionView.delegate = self

        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
//    private func setupConstraints() {
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
}

extension CollectionViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return collectionViewCell
    }
}

extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}

//extension CollectionViewController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        30
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        return collectionViewCell
//    }
//}
//
//extension CollectionViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        navigationController?.pushViewController(ViewController(), animated: true)
//    }
//}

