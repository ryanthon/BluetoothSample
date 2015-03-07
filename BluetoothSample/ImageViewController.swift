//
//  ImageViewController.swift
//  BluetoothSample
//
//  Created by Ryan Khalili on 3/6/15.
//  Copyright (c) 2015 CSR. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var selector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func selectorChanged(sender: AnyObject) {
        
//        switch selector.selectedSegmentIndex {
//            case 0:
//                let image0 = UIImage( named: "image0.png" )
//                imageView.image = image0
//            case 1:
//                let image0 = UIImage( named: "image0.png" )
//                imageView.image = image0
//            default:
//            
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
