//
//  ContentView.swift
//  Hydration App
//
//  Created by k2 tam on 05/09/2022.
//

import SwiftUI

struct RootView: View {
    
    //Two models for app
    private var health: HealthModel
    private var hydration: HydrationModel
    
    init(){
        health = HealthModel()
        hydration = HydrationModel(healthModel: health)
    }
    
    var body: some View {
        HomeView(hydration: hydration)
            .onAppear {
                //Request for healthkit authorization
                health.requestAuthorization { sucess in
                    if !sucess{
                        print("Access not granted!")
                    }
                }
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
