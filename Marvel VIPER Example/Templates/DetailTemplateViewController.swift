//
//  DetailViewControllerTemplate.swift
//  Marvel VIPER Example
//
//  Created by Carlos Henrique Gava on 23/12/21.
//

import Foundation
import UIKit

class DetailTemplateViewController: UIViewController, UITableViewDelegate {
    private let backgroundColor = UIColor(named: "HeaderColor")
    var tableView = UITableView()

    var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "HeaderTitleColor")
        return label
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "HeaderColor")
        return label
    }()

    var image: UIImageView = {
        let backImageView = UIImageView(image: UIImage(named: "NotFound"))
        return backImageView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        setupImage()
        setGradient()
        setupTitleLabel()
        setupLabel()
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.tableFooterView = UIView()
        view.layoutSubviews()
    }


    private func setupImage() {
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        image.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: image.frame.width).isActive = true
        image.contentMode = .scaleAspectFill
        view.layoutSubviews()
    }
    
    private func setGradient() {
        let view = UIView(frame: image.frame)
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        let startingColor = backgroundColor?.cgColor.copy(alpha: 0.6)
        gradient.colors = [startingColor ?? UIColor.clear.cgColor, backgroundColor?.cgColor ?? UIColor.white.cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        image.addSubview(view)
        image.bringSubviewToFront(view)
        view.layoutSubviews()
    }

    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
    }

    private func setupLabel() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        textLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        textLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
    }
}
