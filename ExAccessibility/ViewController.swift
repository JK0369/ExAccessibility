//
//  ViewController.swift
//  ExAccessibility
//
//  Created by 김종권 on 2023/09/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let profileContainerView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }()
    private let thumbnailImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle")
        view.contentMode = .scaleToFill
        return view
    }()
    private let label = {
        let label = UILabel()
        label.text = "iOS 앱 개발 알아가기"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    private let switchButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileContainerView)
        profileContainerView.addSubview(thumbnailImageView)
        profileContainerView.addSubview(switchButton)
        profileContainerView.addSubview(label)
        
        profileContainerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().inset(16)
        }
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        switchButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        label.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(16)
            $0.leading.equalTo(thumbnailImageView)
            $0.bottom.equalToSuperview()
            $0.trailing.lessThanOrEqualToSuperview()
        }
    }
}
