//
//  MainViewController.swift
//  RestReminder
//
//  Created by Александр Лебедев on 22.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var lengthPicker: UIDatePicker!
    @IBOutlet weak var purityPicker: UIDatePicker!
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var setupButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.preButtonsLogic(setupButton: setupButton, changeButton: changeButton, stopButton: stopButton)
        
        presenter.userNotificationManager.notificationCenter.delegate = self
        
        changeButton.layer.cornerRadius = 10
        setupButton.layer.cornerRadius = 10
        stopButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func changeAction(_ sender: Any) {
        presenter.changeTapNotificationBehavior(lengthDate: lengthPicker.date, purityDate: purityPicker.date)
        presenter.changeTapButtonsLogic(changeButton: changeButton)
    }
    
    
    @IBAction func setupAction(_ sender: Any) {
        presenter.setupTapNotificationBehavior(lengthDate: lengthPicker.date, purityDate: purityPicker.date)
        presenter.setupTapButtonsLogic(setupButton: setupButton, changeButton: changeButton, stopButton: stopButton)
    }
    
    
    @IBAction func stopAction(_ sender: Any) {
        
        
        presenter.stopTapNotificationBehavior()
        presenter.stopTapButtonsLogic(setupButton: setupButton, changeButton: changeButton, stopButton: stopButton)
    }
    
    
    
}




//MARK: MainView Extension

extension MainViewController: MainViewProtocol {
    
}



extension MainViewController: UNUserNotificationCenterDelegate {
    
    //Когда приложение открыто
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    //Когда нажимаем на уведомление
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
}
