//
//  HealthKitManager.swift
//  Step Scale
//
//  Created by Marcello Gonzatto Birkan on 29/04/24.
//

import Foundation
import HealthKit
import Observation

@Observable
class HealthKitManager {
  let store = HKHealthStore()
  
  let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
  
//  func addSimulatorData() async {
//    var mockSamples: [HKQuantitySample] = []
//    
//    for i in 0..<28 {
//      let stepQuantity = HKQuantity(unit: .count(), doubleValue: .random(in: 4_000...20_000))
//      let weightQuantity = HKQuantity(unit: .pound(), doubleValue: .random(in: (160 + Double(i/3)...165 + Double(i/3))))
//      
//      let startDay = Calendar.current.date(byAdding: .day, value: -i, to: .now)!
//      let endDay = Calendar.current.date(byAdding: .second, value: 1, to: startDay)!
//      
//      let stepSample = HKQuantitySample(type: HKQuantityType(.stepCount), quantity: stepQuantity, start: startDay, end: endDay)
//      let weightSample = HKQuantitySample(type: HKQuantityType(.bodyMass), quantity: weightQuantity, start: startDay, end: endDay)
//      
//      mockSamples.append(stepSample)
//      mockSamples.append(weightSample)
//    }
//    
//    try! await store.save(mockSamples)
//    print("Dummy data sent 🆙")
//  }
}
