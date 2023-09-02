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
        view.isAccessibilityElement = true
        return view
    }()
    private let label = {
        let label = UILabel()
        label.text = "iOS 앱 개발 알아가기"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    private let switchButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupAccessibility()
        
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
    
    func setupAccessibility() {
        // 1.isAccessibilityElement
        /*
        // UIControl이 아닌 UIView의 isAccessibilityElement 디폴트는 false
        profileContainerView.isAccessibilityElement
        thumbnailImageView.isAccessibilityElement

        // UIControl의 isAccessibilityElement 디폴트는 true
        label.isAccessibilityElement
        switchButton.isAccessibilityElement
         */
        
        // 2.accessibilityTraits
//        switchButton.accessibilityLabel = "스위치 라벨"
        /*
         
         .none: 아무 접근성 특성도 없음을 나타냅니다.
         .button: 버튼 역할을 하는 UI 요소를 나타냅니다.
         .link: 링크 역할을 하는 UI 요소를 나타냅니다.
         .header: 섹션 헤더를 나타내며, 주로 테이블 뷰나 컬렉션 뷰에서 사용됩니다.
         .searchField: 검색 필드 역할을 하는 UI 요소를 나타냅니다.
         .image: 이미지를 나타내는 UI 요소를 나타냅니다.
         .selected: 선택된 상태를 나타냅니다.
         .playsSound: 소리를 재생하는 UI 요소를 나타냅니다.
         .keyboardKey: 키보드의 키를 나타내는 UI 요소를 나타냅니다.
         .staticText: 정적 텍스트 역할을 하는 UI 요소를 나타냅니다.
         .summaryElement: 요약 정보를 제공하는 UI 요소를 나타냅니다.
         .image: 이미지 역할을 하는 UI 요소를 나타냅니다.
         .selected: 선택된 상태를 나타냅니다.
         
         */
        
        // 3.accessibilityLabel
        /*
        // nil
        print(profileContainerView.accessibilityLabel)

        // "account"
        print(thumbnailImageView.accessibilityLabel)

        // "iOS 앱 개발 알아가기"
        print(label.accessibilityLabel)

        // nil
        print(switchButton.accessibilityLabel)
        */
        
        label.accessibilityLabel = "라벨"
        label.accessibilityValue = "벨류"
        label.accessibilityTraits = .header // "머리말"
        label.accessibilityHint = "힌트 문구입니다."
        // "라벨 벨류 머리말 힌트 문구입니다."
        
        thumbnailImageView.accessibilityLabel = "라벨"
        thumbnailImageView.accessibilityValue = "벨류"
        thumbnailImageView.accessibilityTraits = .image
        thumbnailImageView.accessibilityHint = "힌트 문구입니다."
        //
    }
}
