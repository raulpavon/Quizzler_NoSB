//
//  QuizzlerFactory.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import Foundation

protocol QuizzlerFactory {
    func makeQuizzlerViewController(quizzlerCoordinator: QuizzlerCoordinator) -> QuizzlerViewController
}

class QuizzlerFactoryImp: QuizzlerFactory {
    func makeQuizzlerViewController(quizzlerCoordinator: QuizzlerCoordinator) -> QuizzlerViewController {
        let quizzlerViewController = QuizzlerViewController(factory: self, quizzlerCoordinator: quizzlerCoordinator)
        return quizzlerViewController
    }
}
