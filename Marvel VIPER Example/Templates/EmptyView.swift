//
//  Empty.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation
import UIKit

class EmptyView: UIView {
    private var image = UIImageView(image: UIImage(named: "Search"))

    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "HeaderColor")
        return label
    }()

    init(frame: CGRect, queryText: String) {
        super.init(frame: frame)
        label.text = "\(label.text ?? "") \(queryText)"
        configureContents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureContents() {
        self.backgroundColor = UIColor(named: "HeaderColor")
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(image)
        self.addSubview(label)

        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
    }
}
