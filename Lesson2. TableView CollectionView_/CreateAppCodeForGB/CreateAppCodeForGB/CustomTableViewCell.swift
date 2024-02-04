//
//  CustomTableViewCell.swift
//  CreateAppCodeForGB
//
//  Created by Анастасия Рябова on 07.08.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        // label.text = "Hello!"
        label.text = "First!"
        return label
    }()

    private var label1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Second!"
        return label
    }()

    private var label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Third!"
        return label
    }()

    private var stackView: UIStackView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        stackView = UIStackView(arrangedSubviews: [label, label1, label2])
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.setCustomSpacing(30, after: label)

        contentView.addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupTitles(townName: String, lat: Double?, lon: Double?) {

        label.text = townName
        if let lat = lat {
            label1.text = String(lat)
        }
        if let lon = lon {
            label2.text = String(lon)
        }
    }
}

