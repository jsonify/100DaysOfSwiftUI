//
//  SchedulingLocalNotifications.swift
//  HotProspects
//
//  Created by Jason on 1/2/20.
//  Copyright © 2020 Jason. All rights reserved.
//

import UserNotifications
import SwiftUI

struct SchedulingLocalNotifications: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All Set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                // The content is what should be shown, and can be a title, subtitle, sound, image, and so on.
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // The trigger determines when the notification should be shown, and can be a number of seconds from now, an date and time in the future, or a location.
                // Here we will say "show this notification five seconds from now"
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // The request combines the content and trigger, but also adds a unique identifier so you can edit or remove specific alerts later on. If you don’t want to edit or remove stuff, use UUID().uuidString to get a random identifier.
                // Here we will choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // last, we add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct SchedulingLocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingLocalNotifications()
    }
}
