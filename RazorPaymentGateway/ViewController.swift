//
//  ViewController.swift
//  RazorPaymentGateway
//
//  Created by Mac on 30/07/20.
//  Copyright © 2020 Gunde Ramakrishna Goud. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController {
    private var razorPay:RazorpayCheckout!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        razorPay = RazorpayCheckout.initWithKey("rzp_test_jFEAQeTXA4BVYn", andDelegate: self)
    }
    @IBAction func onPayNowBtn(_ sender: UIButton)
    {
        let options: [String:Any] = [
                "amount" : "100000",
                "description": "How to use Razorpay payment Gatway",
                        "image": "https://www.supinehub.com/img/SupineHubLogo.gif",
                        "name": "Swift Hud learning",
                        "prefill": [
                            "contact": "7013195132",
                            "email": "foo@bar.com"
                        ],
                        "theme": [
                            "color": "#fdc5e7"
                        ]
                    ]
            razorPay.open(options)
        }
    }
    
extension ViewController: RazorpayPaymentCompletionProtocol{
    func onPaymentError(_ code: Int32, description str: String) {
       let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
       let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
       alert.addAction(action)
       alert.show(self, sender: nil)
       self.present(alert, animated: true, completion: nil)
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        let alert = UIAlertController(title: "Paid", message: "Payment Sucess", preferredStyle: .alert)
               let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
               alert.addAction(action)
               self.present(alert, animated: true, completion: nil)
    }
    
    
}



