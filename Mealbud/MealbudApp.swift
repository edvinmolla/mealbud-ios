//
//  AcceptAPaymentApp.swift
//  AcceptAPayment
//
//  Created by Thorsten Schaeff on 2/1/21.
//

import SwiftUI
import Stripe
import Firebase
import FirebaseCore
import FirebaseMessaging
import UserNotifications


final class AppDelegate: NSObject, UIApplicationDelegate {
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
) -> Bool {
    FirebaseApp.configure()

    Messaging.messaging().delegate = self

    UNUserNotificationCenter.current().delegate = self

    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in })

    application.registerForRemoteNotifications()

    Messaging.messaging().token { token, error in
        if let error {
            print("Error fetching FCM registration token: \(error)")
        } else if let token {
            print("FCM registration token: \(token)")
        }
    }

    return true
}

func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Oh no! Failed to register for remote notifications with error \(error)")
}

func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    var readableToken = ""
    for index in 0 ..< deviceToken.count {
        readableToken += String(format: "%02.2hhx", deviceToken[index] as CVarArg)
    }
    print("Received an APNs device token: \(readableToken)")
}
}

extension AppDelegate: MessagingDelegate {
@objc func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("Firebase token: \(String(describing: fcmToken))")
}
}

extension AppDelegate: UNUserNotificationCenterDelegate {
func userNotificationCenter(
    _: UNUserNotificationCenter,
    willPresent _: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
) {
    completionHandler([[.banner, .list, .sound]])
}

func userNotificationCenter(
    _: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
) {
    let userInfo = response.notification.request.content.userInfo
    NotificationCenter.default.post(
        name: Notification.Name("didReceiveRemoteNotification"),
        object: nil,
        userInfo: userInfo
    )
    completionHandler()
}
}

let BackendUrl = "https://mealbud.us/"

@main
struct AcceptAPaymentApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        let url = URL(string: BackendUrl + "config")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                let publishableKey = json["publishableKey"] as? String else {
                print("Failed to retrieve publishableKey from /config")
                return
            }
            print("Fetched publishable key \(publishableKey)")
            StripeAPI.defaultPublishableKey = publishableKey
        })
        task.resume()
    }
    
    var body: some Scene {
        WindowGroup {
            MainEntry(drinkOption: .drinks)
                .preferredColorScheme(.light)
                .onOpenURL { url in
                    // This method handles opening custom URL schemes (e.g., "your-app://")
                    print(url)
                    let stripeHandled = StripeAPI.handleURLCallback(with: url)
                    if (!stripeHandled) {
                        // This was not a Stripe url – handle the URL normally as you would
                    }
                }
        }
    }
}
