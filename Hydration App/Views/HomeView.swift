//
//  HomeView.swift
//  Hydration App
//
//  Created by k2 tam on 05/09/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var hydration: HydrationModel
    
    
    //Booleand for 3 sheetViews [Info View, Setting View, Intake View]
    @State var isShowInfo = false
    @State var isShowSettings = false
    @State var isShowIntake = false
    
        
    
    
    var body: some View {
        VStack{
            
            //Date line and Headline
            Group{
                Text(DateHelper.getStringDate(day: Date()))
                    .font(Font.largeTitle)
                    .bold()
                
                Text("Here is your fluid intake")
            }
            
            //Circle Progress and detail
            Group{
                //Cricle proggress
                CircleProgressView(completed: hydration.progress == 1.0, progress: hydration.progress)
                    .frame(width: 200)
                
                
                //Prgoress on target
                Text(" \(hydration.totalIntake) mL / \(hydration.goal) mL")
                    .bold()
            }
            
            
            //Intake list
            
            ZStack{
                //Background color
                Color("background")
                    .opacity(0.2)
                
                //Intake lists
                List{
                    ForEach(hydration.intake){intake in
                        IntakeView(drink: intake)
                            .frame(height: 50)
                    }
                    .onDelete(perform: delete)
                }
                
            }
            .padding(.bottom)
            .frame(height: 400)
            
            
            //Utilities Buttons
            HStack{
                //Info button
                Button {
                    //Open info
                    isShowInfo.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                    
                }
                
                Spacer()
                
                //Intake button
                Button {
                    //Show add intake view
                    isShowIntake.toggle()
                } label: {
                    
                    HStack{
                        Text("Add Intake")
                        Image(systemName: "plus.circle")
                    }
                }
                .buttonStyle(customButtonStyle())
                
                
                Spacer()
                
                //Settings button
                Button {
                    //Show settings view
                    isShowSettings.toggle()
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(height: 26)
            
            .foregroundColor(.black)
        }
        .padding(.horizontal)
        .sheet(isPresented: $isShowIntake, content: {
            AddIntakeView(hydration: self.hydration, isShowAddIntake: $isShowIntake)
        })
        .sheet(isPresented: $isShowInfo) {
            InfoView()
        }
        .sheet(isPresented: $isShowSettings) {
            SettingsView(hydration: hydration, existingGoalIndex: hydration.goalIndex, isShowSettings: $isShowSettings)
        }
        
    }
    
    // Delete function used by the list's built-int deletion
    func delete(at offsets: IndexSet) {
        hydration.removeIntake(offset: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(hydration: Constants.sampleModel, isShowInfo: false, isShowSettings: false)
    }
}

