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

        changeButton.isHidden = true
        stopButton.isHidden = true
        
      
//        notificationCenter.delegate = self

     
       
        
    }


    @IBAction func changeAction(_ sender: Any) {
        
        presenter.changeTap(lengthDate: lengthPicker.date, purityDate: purityPicker.date)
    }
    
    
    @IBAction func setupAction(_ sender: Any) {
        presenter.setupTap(lengthDate: lengthPicker.date, purityDate: purityPicker.date)       
    }
    
    
    @IBAction func stopAction(_ sender: Any) {
        presenter.stopTap()
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
