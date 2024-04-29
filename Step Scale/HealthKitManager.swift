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
}
