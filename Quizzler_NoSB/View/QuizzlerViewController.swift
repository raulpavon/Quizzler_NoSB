//
//  QuizzlerViewController.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import UIKit

class QuizzlerViewController: UIViewController {
    
    weak var quizzlerCoordinator: QuizzlerCoordinator?
    private let factory: QuizzlerFactory
    var quizManager = QuizManager()
    
    private lazy var quizzlerUIView: QuizzlerUIView = {
        let view = QuizzlerUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init(factory: QuizzlerFactory, quizzlerCoordinator: QuizzlerCoordinator) {
        self.factory = factory
        self.quizzlerCoordinator = quizzlerCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
        setTarget()
    }
    
    private func addComponents() {
        view.addSubview(quizzlerUIView)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            quizzlerUIView.topAnchor.constraint(equalTo: view.topAnchor),
            quizzlerUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizzlerUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quizzlerUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setTarget() {
        quizzlerUIView.setBtTargets(target: self, action: #selector(answerButtonPressed(_:)))
    }
    
    @objc private func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? ""
        
        if quizManager.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
            sender.layer.cornerRadius = 25
        } else {
            sender.backgroundColor = .red
            sender.layer.cornerRadius = 25
        }
        
        quizManager.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        var answer = Answer()
        answer.question = quizManager.getQuestion()
        answer.progress = quizManager.getProgress()
        answer.score = quizManager.getScore()
        quizzlerUIView.updateUI(answer: answer)
    }
}
