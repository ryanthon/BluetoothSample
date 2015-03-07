//
//  ViewController.swift
//  BluetoothSample
//
//  Created by Ryan Khalili on 3/6/15.
//  Copyright (c) 2015 CSR. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var scanTimer: NSTimer!
    var cbManager: CBCentralManager!
    var peripheral: CBPeripheral?
//    lazy var cbManager: CBCentralManager = {
//        let manager = CBCentralManager( delegate: self, queue: nil )
//        return manager
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cbManager = CBCentralManager( delegate: self, queue: nil )
        //cbManager.delegate = self
        
        
        scanTimer = NSTimer.scheduledTimerWithTimeInterval( 5, target: self, selector: "doScan", userInfo: nil, repeats: true )
        
        
    }
    
    func doScan() {
        
        //cbManager.scanForPeripheralsWithServices( [], options: nil )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
        
        println( "Name: \(peripheral.name)" )
//        println( "Advertisement Data: \(advertisementData)" )
        
//        if let name = peripheral.name {
//            if name == "CSR HR Sensor" {
//                peripheral.delegate = self
//                self.peripheral = peripheral
//                cbManager.stopScan()
//                cbManager.connectPeripheral( peripheral, options: nil )
//            }
//        }
    }
    
    func peripheral(peripheral: CBPeripheral!, didDiscoverServices error: NSError!) {
        
        for service in peripheral.services {
            
            println( "services: \(service)" )

            self.peripheral?.discoverCharacteristics( [], forService: service as CBService )
        }
    }
    
    func peripheral(peripheral: CBPeripheral!, didDiscoverCharacteristicsForService service: CBService!, error: NSError!) {
        
        println( "characteristics: \(service.characteristics)" );
        for characteristic in service.characteristics {
            
            println( "\(characteristic)")
        }
    }
    
    func peripheralDidUpdateRSSI(peripheral: CBPeripheral!, error: NSError!) {
        println( peripheral.RSSI )
    }
    
    func centralManager(central: CBCentralManager!, didConnectPeripheral peripheral: CBPeripheral!) {
        
        println( "Connected peripheral: \(peripheral.name)" )
        self.peripheral = peripheral
        self.peripheral?.discoverServices( [] )
        self.peripheral?.delegate = self
    }
    
    func centralManager(central: CBCentralManager!, didFailToConnectPeripheral peripheral: CBPeripheral!, error: NSError!) {
        
        println( "Failed to connect to peripheral: \(peripheral.name)" )
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        switch central.state {
            case CBCentralManagerState.Unknown:
                print( "Unknown" )
            case CBCentralManagerState.Resetting:
                print( "Resetting" )
            case CBCentralManagerState.Unsupported:
                print( "Unsupported" )
            case CBCentralManagerState.Unauthorized:
                print( "Unsupported" )
            case CBCentralManagerState.PoweredOn:
                print( "Powered On" )
                cbManager.scanForPeripheralsWithServices( [], options: nil )
            case CBCentralManagerState.PoweredOff:
                print( "Powered Off" )
            default:
                print( "Default" )
        }
    }
}

