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
    var view: MainViewProtocol? { get set }
    var userNotificationManager: UserNotificationsManagerProtocol { get set}
    init(view: MainViewProtocol)
    func setupTap(lengthDate: Date, purityDate: Date)
    func changeTap(lengthDate: Date, purityDate: Date)
    func stopTap()
}


class MainViewPresenter: MainViewPresenterProtocol {
    
    var userNotificationManager: UserNotificationsManagerProtocol = UserNotificationManager()
    
    weak var view: MainViewProtocol?
    
    required init(view: MainViewProtocol) {
        self.view = view
        userNotificationManager.registerNotifications()
    }
    
    func setupTap(lengthDate: Date, purityDate: Date) {
        userNotificationManager.sendRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
        userNotificationManager.sendEndRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
    }
    
    func changeTap(lengthDate: Date, purityDate: Date) {
        userNotificationManager.cancelNotification()
        userNotificationManager.sendRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
        userNotificationManager.sendEndRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
    }
    
    func stopTap() {
        userNotificationManager.cancelNotification()
    }
    
    
}
