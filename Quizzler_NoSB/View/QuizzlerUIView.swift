//
//  QuizzlerUIView.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import UIKit

class QuizzlerUIView: UIView {
    enum QuizzlerUIViewConstraints {
        enum LbScore {
            static let fontSize: CGFloat = 17
        }
        enum LbQuestion {
            static let fontSize: CGFloat = 30
        }
        enum BtTrue {
            static let fontSize: CGFloat = 25
            static let height: CGFloat = 80
        }
        enum BtFalse {
            static let fontSize: CGFloat = 25
            static let height: CGFloat = 80
        }
        enum StackContainer {
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
            static let bottom: CGFloat = -20
        }
        enum ImgBackground {
            static let height: CGFloat = 102
        }
        enum ProgressBar {
            static let height: CGFloat = 10
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(hex: GlobalConstants.Colors.blue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgBackground: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.background))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.contentMode = .scaleToFill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let lbScore: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: QuizzlerUIViewConstraints.LbScore.fontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let lbQuestion: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: QuizzlerUIViewConstraints.LbQuestion.fontSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var btTrue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.Quizzler.True, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: GlobalConstants.Images.button), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: QuizzlerUIViewConstraints.BtTrue.fontSize, weight: .black)
        return button
    }()
    
    private lazy var btFalse: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(GlobalConstants.Quizzler.False, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: GlobalConstants.Images.button), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: QuizzlerUIViewConstraints.BtFalse.fontSize)
        return button
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar)
        progressBar.progressTintColor = UIColor(hex: GlobalConstants.Colors.pink)
        progressBar.trackTintColor = .white
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgBackground)
        mainContainer.addSubview(stackContainer)
        stackContainer.addArrangedSubview(lbScore)
        stackContainer.addArrangedSubview(lbQuestion)
        stackContainer.addArrangedSubview(btTrue)
        stackContainer.addArrangedSubview(btFalse)
        stackContainer.addArrangedSubview(progressBar)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: QuizzlerUIViewConstraints.StackContainer.leading),
            stackContainer.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: QuizzlerUIViewConstraints.StackContainer.trailing),
            stackContainer.bottomAnchor.constraint(equalTo: mainContainer.safeAreaLayoutGuide.bottomAnchor, constant: QuizzlerUIViewConstraints.StackContainer.bottom),
            
            imgBackground.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor),
            imgBackground.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor),
            imgBackground.bottomAnchor.constraint(equalTo: stackContainer.bottomAnchor),
            imgBackground.heightAnchor.constraint(equalToConstant: QuizzlerUIViewConstraints.ImgBackground.height),
            
            btTrue.heightAnchor.constraint(equalToConstant: QuizzlerUIViewConstraints.BtTrue.height),
            
            btFalse.heightAnchor.constraint(equalToConstant: QuizzlerUIViewConstraints.BtFalse.height),
            
            progressBar.heightAnchor.constraint(equalToConstant: QuizzlerUIViewConstraints.ProgressBar.height),
        ])
    }
    
    func setBtTargets(target: Any?, action: Selector) {
        btTrue.addTarget(target, action: action, for: .touchUpInside)
        btFalse.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func updateUI(answer: Answer) {
        lbQuestion.text = answer.question
        progressBar.progress = answer.progress
        lbScore.text = "Score: \(answer.score)"
        btTrue.backgroundColor = .clear
        btFalse.backgroundColor = .clear
    }
}
