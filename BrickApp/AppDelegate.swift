

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Override point for customization after application launch.
        guard let window = self.window else { fatalError("No Window") }
        window.rootViewController = HomeScreen()
        
        // Make it visible
        window.makeKeyAndVisible()
        return true
    }


}

