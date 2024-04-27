//
//  HealthDataListView.swift
//  Step Scale
//
//  Created by Marcello Gonzatto Birkan on 27/04/24.
//

import SwiftUI

struct HealthDataListView: View {
  let metric: HealthMetricContext
  @State private var addDataDate = Date()
  @State private var valueToAdd = ""
  @State private var isShowingAddData = false
  
    var body: some View {
      List(0..<28) { i in
        HStack {
          Text(Date(), format: .dateTime.month().day().year())
          
          Spacer()
          
          Text(67.32, format: .number.precision(.fractionLength(metric == .steps ? 0 : 2)))
        }
      }
      .navigationTitle(metric.title)
      .sheet(isPresented: $isShowingAddData, content: {
        addDataView
      })
      .toolbar(content: {
        Button("Add Data", systemImage: "plus") {
          isShowingAddData.toggle()
        }
      })
    }
  
  var addDataView: some View {
    NavigationStack {
      Form {
        DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
        
        HStack {
          Text(metric.title)
          Spacer()
          TextField("Value", text: $valueToAdd)
            .multilineTextAlignment(.trailing)
            .frame(width: 140)
            .keyboardType(metric == .steps ? .numberPad : .decimalPad)
        }
      }
      .navigationTitle(metric.title)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button("Dismiss", role: .cancel) {
            isShowingAddData.toggle()
          }
        }
        
        ToolbarItem(placement: .confirmationAction) {
          Button("Add") {
            isShowingAddData.toggle()
          }
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    HealthDataListView(metric: HealthMetricContext.weight)
  }
}
