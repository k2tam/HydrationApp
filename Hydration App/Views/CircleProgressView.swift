//
//  ProgressView.swift
//  Hydration App
//
//  Created by k2 tam on 05/09/2022.
//

import SwiftUI

struct CircleProgressView: View {
    
    var completed: Bool
    var progress: Double
    
    var body: some View {
        
        ZStack{
            
            //If progress has been completed, display green circle
            if completed{
                Circle()
                    .stroke(lineWidth: 20.0)
                    .foregroundColor(.green)
                    .opacity(1.0)
                    .shadow(color: .green, radius: 5, x: 0, y: 0)
                    
            }else{
                //Background circle (lighter color)
                Circle()
                    .stroke(lineWidth: 20)
                    .foregroundColor(.blue)
                    .opacity(0.3)
                    .shadow(color: .blue, radius: 5, x: 0, y: 0)

                //Foreground circle(deeper color)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.blue)
                    .shadow(color: .blue, radius: 5, x: 0, y: 0)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.linear)
                    
                
                    
            }
           
            
            //Progress detail
            VStack(spacing: 10){
                HStack{
                    Text(String(format: "%.0f%%", min(self.progress,1.0) * 100))
                        .bold()
                        .font(Font.largeTitle)
                    
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .foregroundColor(Color.blue)
                    
                }
                
                Text("of daily goal")
                
            }
            
        }
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(completed: false, progress: 0.1)
    }
}
