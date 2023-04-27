//
//  NotificationManager.swift
//  GeofencingDemo
//
//  Created by ShafiulAlam-00058 on 4/27/23.
//

import Foundation
import NotificationCenter

class NotificationManager {
	static let shared = NotificationManager()
	private init() {}
	
	func authorizeForNotification() {
		let options: UNAuthorizationOptions = [.badge, .sound, .alert]
		
		UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
			guard let error = error else {
				return
			}
			if granted {
				print("set successfully")
			}
			else {
				print("something wrong!")
			}
		}
	}
	
	func scheduleNotification(title: String, body: String) {
		let content = UNMutableNotificationContent()
		
		content.title = title
		content.body = body
		content.sound = .default
		content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
		
		var dateComponent = DateComponents()
		dateComponent.hour = 14
		dateComponent.minute = 36
		
		let trigger = UNTimeIntervalNotificationTrigger(
			timeInterval: 5,
			repeats: false
		)
		
		let request = UNNotificationRequest(
			identifier: "3",
			content: content,
			trigger: trigger
		)
		
		UNUserNotificationCenter.current().add(request)
	}
}
