//
//  MainPresenter.swift
//  RestReminder
//
//  Created by Александр Лебедев on 23.10.2022.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol)
    func setupTap()
    func changeTap()
    func stopTap()
}


class MainViewPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol!
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func setupTap() {
        print("setup")
    }
    
    func changeTap() {
        print("change")
    }
    
    func stopTap() {
        print("stop")
    }
    
    
}
