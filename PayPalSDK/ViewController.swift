//
//  ViewController.swift
//  PayPalSDK
//
//  Created by Messerschmidt, Tim on 08.06.14.
//  Copyright (c) 2014 Messerschmidt, Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PayPalPaymentDelegate {
    var config = PayPalConfiguration()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
        PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentNoNetwork)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func buyClicked(sender : AnyObject) {
        let amount = NSDecimalNumber.decimalNumberWithString("10.00")
        
        println("amount \(amount)")
        
        var payment = PayPalPayment()
        payment.amount = amount
        payment.currencyCode = "EUR"
        payment.shortDescription = "Swift payment"
        
        if (!payment.processable) {
            println("You messed up!")
        } else {
            println("THis works")
            var paymentViewController = PayPalPaymentViewController(payment: payment, configuration: config, delegate: self)
            self.presentViewController(paymentViewController, animated: false, completion: nil)
        }
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController!, didCompletePayment completedPayment: PayPalPayment!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

