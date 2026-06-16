//
//  ContentView.swift
//  TestImageDrag
//
//  Created by user on 15.06.2026.
//

import SwiftUI

struct ContentView: View {
  @State private var sliderOffset: CGFloat = 0
  var body: some View {
	 GeometryReader{ geo in
		ZStack(alignment: .leading){
		  Image("first")
			 .resizable()
			 .scaledToFill()
		  
		  Image("first2")
			 .resizable()
			 .scaledToFill()
			 .frame(maxWidth: geo.size.width, maxHeight: geo.size.height, alignment: .leading)
			 .frame(width: sliderOffset, alignment: .leading)
			 .clipped()
		  
		  
		  Rectangle()
			 .frame(width: 4, alignment: .leading)
			 .overlay(
				Circle()
				  .fill(.black)
				  .frame(width: 35)
			 )
			 .offset(x: sliderOffset)
			 .gesture(ImageDragGesture)
		  
		}
		.frame(width: geo.size.width, alignment: .leading)
		.onAppear{
		  sliderOffset = geo.size.width / 2
		}
	 }
	 .frame(height: 400)
	 .padding()
  }
  
  
  private var ImageDragGesture: some Gesture{
	 DragGesture().onChanged { value in
		withAnimation(.easeInOut){
		  print(value.location.x)
		  self.sliderOffset = max(0, value.location.x)
		}
	 }
  }
}


#Preview {
  ContentView()
}
