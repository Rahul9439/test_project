import UIKit
import Flutter
import CoreBluetooth

class YourAppDelegate: NSObject, UIApplicationDelegate, CBCentralManagerDelegate {
    var centralManager: CBCentralManager!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize CBCentralManager
        centralManager = CBCentralManager(delegate: self, queue: nil)

        return true
    }

    // CBCentralManagerDelegate method
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            // Bluetooth is powered on, you can start using Bluetooth functionality here
            print("Bluetooth is powered on")
        case .poweredOff:
            // Bluetooth is powered off, handle this state as needed
            print("Bluetooth is powered off")
        case .unsupported:
            // Bluetooth is unsupported on this device, handle this state as needed
            print("Bluetooth is unsupported")
        case .unauthorized:
            // App is not authorized to use Bluetooth, handle this state as needed
            print("App is not authorized to use Bluetooth")
        case .unknown:
            // Bluetooth state is unknown, handle this state as needed
            print("Bluetooth state is unknown")
        case .resetting:
            // Bluetooth is resetting, handle this state as needed
            print("Bluetooth is resetting")
        }
    }
}

