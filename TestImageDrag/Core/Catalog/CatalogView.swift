//
//  CatalogView.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import SwiftUI

struct CatalogView: View {
  @State private var catalog: [CatalogModel] = CatalogModel.getExamples()
    var body: some View {
		  ScrollView{
			 header
			 LazyVStack(spacing: 10){
				ForEach(catalog){item in
				  CatalogCardView(catalogItem: item)
				}
			 }
			 .padding()
		  }
    }
  
  private var header: some View{
	 HStack{
		Button{}label:{
		  Text("GET PRO")
			 .fontWeight(.bold)
			 .foregroundStyle(.white)
			 .padding(10)
			 .background(
				Capsule()
				  .fill(Color.linearGradient)
			 )
		}
		Spacer()
		
		Button{}label: {
		  Image(systemName: "person.circle")
			 .font(.title)
			 .foregroundStyle(.gray)
		}
	 }
	 .padding(.horizontal)
  }
}

#Preview {
  CatalogView()
}
