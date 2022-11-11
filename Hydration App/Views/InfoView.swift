//
//  InfoView.swift
//  Hydration App
//
//  Created by k2 tam on 05/09/2022.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            //Headline
            Text("Info")
                .font(Font.largeTitle)
                .bold()
            
            //Graphic
            VStack{
                //Drop icon
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
                    .foregroundColor(.blue)
                
                //Ruler icon
                Image(systemName: "ruler")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 75)
            }
            
            
            Text("Every day, we lose water throught our breath, perspiration, urine and bowel movements. For our bodies to functionproperly, we must replenish its water supply by consuming bverages and foods that contain water.\nAdequate daily fluid intake is approximately:")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            //Intake recommendation for men/women
            VStack{
                Text("Men - 15.5 cups (3.7 L) of fluids daily")
                    .bold()
                
                Text("Woman - 11.5 cups (3.7 L) of fluids daily")
                    .bold()
            }
            
            Spacer()
            
            //Health graphic
            HStack{
                Spacer()
                Image(systemName: "figure.walk")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                
                Spacer()
                
                Image(systemName: "cloud.sun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.green)

                
                Spacer()
                
                Image(systemName: "heart.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
                
                Spacer()

                    
            }
            .padding()
            
            //Last info and source
            VStack{
                Text("Your total fluid intake may need to modified based on levef of exercise, the environment (i.e. hot/humid weather increses sweat) and overall health")
                    .multilineTextAlignment(.center)
                
                
                Text("Source: Mayo Clinic")
                    .bold()
                    .font(Font.caption)
                    .padding([.horizontal, .vertical])
            }
            
            Spacer()
            
            
            

        }
        .padding(.horizontal)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
