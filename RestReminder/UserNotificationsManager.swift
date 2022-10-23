//
//  UserNotificationsManager.swift
//  RestReminder
//
//  Created by Александр Лебедев on 23.10.2022.
//

import Foundation
import UserNotifications


protocol UserNotificationsManagerProtocol {
    var notificationCenter: UNUserNotificationCenter { get set }
    func registerNotifications()
    func sendRestNotifications(lengthDate: Date, purityDate: Date)
    func sendEndRestNotifications(lengthDate: Date, purityDate: Date)
    func cancelNotification()
}


class UserNotificationManager: UserNotificationsManagerProtocol {
    
    var notificationCenter = UNUserNotificationCenter.current()
    
    
    init() { }
    
    
    func registerNotifications() {
         
         notificationCenter.requestAuthorization(options: [.alert, .sound, .alert]) { granted, error in
             guard granted else { return }
             self.notificationCenter.getNotificationSettings { settings in
                 guard settings.authorizationStatus == .authorized else { return }
             }
         }
    }
    
    func sendRestNotifications(lengthDate: Date, purityDate: Date) {
        
        let calendar = Calendar.current
        
        let hours = calendar.component(.hour, from: purityDate)
        let minute = calendar.component(.minute, from: purityDate)
        let secondsPurity = (hours * 120) + (minute * 60)
        
        let hoursLength = calendar.component(.hour, from: lengthDate)
        let minuteLength = calendar.component(.minute, from: lengthDate)
        let secondsLegth = (hoursLength * 120) + (minuteLength * 60)
        
        let content = UNMutableNotificationContent()
        content.title = "Время отдохнуть"
        content.body = "\(minute) минут(а) отдыха"
        content.sound = UNNotificationSound.default
        
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(secondsPurity), repeats: false)
        
        let request = UNNotificationRequest(identifier: "a", content: content, trigger: trigger)
        
        notificationCenter.add(request)
        
        
        
    }
    
    
    func sendEndRestNotifications(lengthDate: Date, purityDate: Date) {
        
        
        let calendar = Calendar.current
        
           let lengthHours = calendar.component(.hour, from: lengthDate)
           let lengthMinute = calendar.component(.minute, from: lengthDate)
           let lengthSeconds = (lengthHours * 120) + (lengthMinute * 60)
        
            let purityHours = calendar.component(.hour, from: purityDate)
            let purityMinute = calendar.component(.minute, from: purityDate)
            let puritySeconds = (purityHours * 120) + (purityMinute * 60)
        
            let seconds = lengthSeconds + puritySeconds
      
        
        let content = UNMutableNotificationContent()
        content.title = "Время отдыха подошло к концу"
        content.body = "Следующий перерыв начнется через \(seconds / 60) минут(ы)"
        content.sound = UNNotificationSound.default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(seconds), repeats: true)
        
        let request = UNNotificationRequest(identifier: "b", content: content, trigger: trigger)
        
        notificationCenter.add(request)
        
       
    }
    
    
    func cancelNotification() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
}
