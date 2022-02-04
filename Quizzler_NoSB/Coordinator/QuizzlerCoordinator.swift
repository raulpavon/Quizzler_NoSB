//
//  QuizzlerCoordinator.swift
//  Quizzler_NoSB
//
//  Created by Raúl Pavón on 04/02/22.
//

import Foundation
import UIKit

class QuizzlerCoordinator {
    var navigationController: UINavigationController
    private let factory =  QuizzlerFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let quizzlerViewController = factory.makeQuizzlerViewController(quizzlerCoordinator: self)
        navigationController.setViewControllers([quizzlerViewController], animated: false)
    }
}
