//
//  MainPresenter.swift
//  RestReminder
//
//  Created by Александр Лебедев on 23.10.2022.
//

import Foundation
import UIKit


protocol MainViewProtocol: AnyObject {
    
}

protocol MainViewPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var userNotificationManager: UserNotificationsManagerProtocol { get set}
    init(view: MainViewProtocol)
    func preButtonsLogic(setupButton: UIButton, changeButton: UIButton, stopButton: UIButton)
    func setupTapNotificationBehavior(lengthDate: Date, purityDate: Date)
    func setupTapButtonsLogic(setupButton: UIButton, changeButton: UIButton, stopButton: UIButton)
    func changeTapNotificationBehavior(lengthDate: Date, purityDate: Date)
    func changeTapButtonsLogic(changeButton: UIButton)
    func stopTapNotificationBehavior()
    func stopTapButtonsLogic(setupButton: UIButton, changeButton: UIButton, stopButton: UIButton)
    func userDefaultsSave(lengthPickerDate: Date, purityPickerDate: Date)
    
}


class MainViewPresenter: MainViewPresenterProtocol {
    
    var userNotificationManager: UserNotificationsManagerProtocol = UserNotificationManager()
    
    
    weak var view: MainViewProtocol?
    
    required init(view: MainViewProtocol) {
        self.view = view
        userNotificationManager.registerNotifications()
    }
    
    func preButtonsLogic(setupButton: UIButton, changeButton: UIButton, stopButton: UIButton) {
        changeButton.isHidden = true
        stopButton.isHidden = true
        
        userNotificationManager.notificationCenter.getPendingNotificationRequests(completionHandler: { request in
            
            if request.first != nil {
                DispatchQueue.main.async {
                    setupButton.isHidden = true
                    stopButton.isHidden = false
                    changeButton.isHidden = false
                }
            }
        })
    }
    
    func loadUserDefaults() {
        
    }
    
    func userDefaultsSave(lengthPickerDate: Date, purityPickerDate: Date) {
        
        UserDefaults.standard.set(lengthPickerDate, forKey: "lPicker")
        UserDefaults.standard.set(purityPickerDate, forKey: "pPicker")
    }

    
    
    func setupTapNotificationBehavior(lengthDate: Date, purityDate: Date) {
        userNotificationManager.sendRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
        userNotificationManager.sendEndRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
    }
    
    func setupTapButtonsLogic(setupButton: UIButton, changeButton: UIButton, stopButton: UIButton) {
        
        setupButton.isHidden = true
        stopButton.isHidden = false
        changeButton.isHidden = false
        
    }
    
    
    func changeTapNotificationBehavior(lengthDate: Date, purityDate: Date) {
        userNotificationManager.cancelNotification()
        userNotificationManager.sendRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
        userNotificationManager.sendEndRestNotifications(lengthDate: lengthDate, purityDate: purityDate)
        
    }
    func changeTapButtonsLogic(changeButton: UIButton) {
        
        DispatchQueue.main.async {
            UIButton.animate(withDuration: 0.8, animations: {
                changeButton.isEnabled = false
                changeButton.setTitle("Изменено", for: .normal)
                changeButton.titleLabel?.textColor = .white
                changeButton.backgroundColor = UIColor(hue: 0.6194, saturation: 0.37, brightness: 1, alpha: 1.0)
            }) { _ in
                changeButton.isEnabled = true
                changeButton.setTitle("Изменить", for: .normal)
                changeButton.backgroundColor = UIColor(hue: 0.6194, saturation: 0.37, brightness: 0.88, alpha: 1.0)
            }
        }
        
    }
    
    
    func stopTapNotificationBehavior() {
        userNotificationManager.cancelNotification()
    }
    
    func stopTapButtonsLogic(setupButton: UIButton, changeButton: UIButton, stopButton: UIButton) {
        stopButton.isHidden = true
        setupButton.isHidden = false
        changeButton.isHidden = true
    }
    
}
