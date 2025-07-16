//
//  ViewController.swift
//  NSOperationTask3
//
//  Created by Lena Hunanian on 16.07.25.
//

import UIKit

class ViewController: UIViewController {
    
    let operationQueue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let opB = BlockOperation {
            print("Operation \"B\" started")
             for _ in 0..<1000000 {
                // do nothing
             }
             print("Operation \"B\" finished")
        }
        
        let opA = BlockOperation {
            print("Operation \"A\" started")
             for _ in 0..<1000000 {
                // do nothing
             }
             print("Operation \"A\" finished")
            opB.cancel()
        }
        
        
        
        //MARK: -  test with dependency and cancellation
//        opB.addDependency(opA)
//        operationQueue.addOperations([opB, opA], waitUntilFinished: false)
        
        //MARK: CONCLUSION
        //output: opB has a dependency set to opA , so it waits for opA to finish to start itself, but inside opA , opB is already cancelled so it never starts executing and nothing appears in console
        
        
        //MARK: - test without dependency
        operationQueue.addOperations([opB, opA], waitUntilFinished: false)
        //MARK: CONCLUSION
        //output: even though opB is cancelling inside opA, opB doesn't have dependency to opA, so they both start simultaneously, and opB.cancel() line doesn't matter anymore because opB has already started
        
    }
    
}

