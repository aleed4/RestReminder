//
//  AsselderModuleBuilder.swift
//  RestReminder
//
//  Created by Александр Лебедев on 22.10.2022.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createMainModule() -> UIViewController
}


class AsselderModuleBuilder: AsselderBuilderProtocol {
    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
