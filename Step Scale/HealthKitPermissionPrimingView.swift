//
//  HealthKitPermissionPrimingView.swift
//  Step Scale
//
//  Created by Marcello Gonzatto Birkan on 28/04/24.
//

import SwiftUI
import HealthKitUI

struct HealthKitPermissionPrimingView: View {
  @Environment(HealthKitManager.self) private var hkManager
  @Environment(\.dismiss) private var dissmis
  let description = """
    This app displays your step and weight data in interactive charts.
    
    You can also add new step or weight data to Apple Health from this app. Your data is private and secure
    """
  @State private var isShowingHealthKitPermissions = false
  
    var body: some View {
      VStack(spacing: 130) {
        VStack(alignment: .leading, spacing: 10.0) {
          Image(.appleHealth)
            .resizable()
            .frame(width: 90, height: 90)
          .shadow(color: .gray.opacity(0.3), radius: 16)
          .padding(.bottom, 12)
          
          Text("Apple Health Integration")
            .font(.title2).bold()
          
          Text(description)
            .foregroundStyle(.secondary)
        }
        
        Button("Connect Apple Health") {
          isShowingHealthKitPermissions.toggle()
        }
        .buttonStyle(.borderedProminent)
        .tint(.pink)
      }
      .padding(30)
      .healthDataAccessRequest(
        store: hkManager.store,
        shareTypes: hkManager.types,
        readTypes: hkManager.types,
        trigger: isShowingHealthKitPermissions) { result in
          switch result {
          case .success(_):
            dissmis()
          case .failure(_):
            // TODO: handle the error later
            dissmis()
          }
        }
    }
}

#Preview {
    HealthKitPermissionPrimingView()
    .environment(HealthKitManager())
}
