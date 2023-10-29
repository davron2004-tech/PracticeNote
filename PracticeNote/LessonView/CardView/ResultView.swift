//
//  ResultView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 26/10/23.
//

import SwiftUI

struct ResultView: View {
    var total:Int
    var result:Int
    var practiceMethod:PracticeMethod
    @Binding var isResultView:Bool
    var dismiss:DismissAction
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text("Your result:")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .padding(.bottom)
                    if practiceMethod == .know_dontKnow{
                        
                        Text("You got \(result) words correct out of \(total) words!")
                        
                            .lineSpacing(3)
                            .font(.system(size: 23))
                            .fontWeight(.bold)
                    }
                    else if practiceMethod == .true_false{
                        
                        Text("You know\n\(result) words\nout of \n\(total) words!")
                        
                            .lineSpacing(3)
                            .font(.system(size: 23))
                            .fontWeight(.bold)
                        
                    }
                    Spacer()
                    Button{
                        isResultView = false
                        dismiss()
                    }label: {
                        Text("OK")
                    }
                    .buttonStyle(.borderedProminent)
                }
                
            }
            
            
        }
        
    }
}


