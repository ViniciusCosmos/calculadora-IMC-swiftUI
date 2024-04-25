//
//  ContentView.swift
//  aula03_IMC
//
//  Created by Turma02-26 on 19/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var altura: Double = 0.0
    @State private var peso: Double = 0.0
    @State private var imc: Double = 0.0
    @State private var resultado: String = ""
    @State private var cor: Color = .green

    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
   
    var body: some View {
        
        ZStack{
            cor.ignoresSafeArea()
            
        VStack {
            Text("Calculadora de IMC")
                .font(.system(size: 35))
                .padding(.bottom, 560)
        }
        VStack{
            TextField("Digite seua altura", value: $altura, formatter: formatter)
            
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
                .background(Color.white)
                .frame(width: 300, height: 35)
                .cornerRadius(10)
                .padding(10)
                
            
            TextField("Digite sua altura", value: $peso, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black)
                .background(Color.white)
                .frame(width: 300, height: 35)
                .cornerRadius(10)
            
            Spacer().frame(height: 25)
            
        }.padding(.bottom, 350)
                .padding(15)
            
            VStack{
                Button("Calcular") {
                    
                    
                    imc = peso / (altura * altura)
                    
                    if imc <= 18.5{
                        resultado = "Baixo peso"
                        cor = Color("baixo-peso")
                    }
                    else if imc > 18.5 && imc <= 24.99{
                        resultado = "Normal"
                        cor = Color("normal")
                    }
                    else if imc > 24.99 && imc <= 29.99{
                        resultado = "Sobrepeso"
                        cor = Color("sobrepeso")
                    }
                    else if imc >= 30{
                        resultado = "Peso Brunno pesadao"
                        cor = Color("obesidade")
                    }

                }    .padding(16)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(5)
            }.padding(.bottom, 200)
    
            
            VStack{
                Text("IMC = " + resultado)
            }
            VStack{
                Image("tabela-IMC")
                    .resizable()
                    .frame(width: 420, height: 240)
                    .padding(.top, 350)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
