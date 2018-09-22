//
//  ViewController.swift
//  LocalNotif
//
//  Created by sanamsuri on 22/09/18.
//  Copyright © 2018 sanamsuri. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {
    
    let notifId = "myNotif"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        requestPermission()
    }
    
    
    func requestPermission(){
        let options = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Unable to get the permission ", error)
                return
            }
            
        }
    }
    
    
    // Actions
    
    @IBAction func notifButtonPressed(_ sender: Any) {
        print("Hello")
        scheduleNotification(title: "Water Time!!!", subtitle: "Thirst??", body: "Time to drink a glass of water", inSeconds: 2, repeater: false)
    }
    
    
    @IBAction func newButtonPressed(_ sender: Any) {
        scheduleNotification(title: "Dinner Time", subtitle: "Tasty Food", body: "Time to eat dinner", inSeconds: 2, repeater: false)
    }
    
    
    func scheduleNotification(title: String, subtitle: String, body: String, inSeconds: TimeInterval, repeater: Bool) {
        let localNotification = UNMutableNotificationContent()
        localNotification.title = title
        localNotification.subtitle = subtitle
        localNotification.body = body
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: repeater)
        
        let request = UNNotificationRequest(identifier: notifId, content: localNotification, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Creating notification failed ", error)
                
                return
            }
            
        }
        
    }
    

}

