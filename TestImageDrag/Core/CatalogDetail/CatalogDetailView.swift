//
//  CatalogDetailView.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import SwiftUI

struct CatalogDetailView: View {
  @State private var sliderOffset: CGFloat = 100
  let catalogItem: CatalogModel
  var body: some View {
	 ZStack{
		Color.white.mix(with: .gray, by: 0.01)
		VStack{
		  Button{
			 withAnimation(){
				NavigationManager.shared.secondaryView = nil
			 }
		  }label:{
			 Image(systemName: "chevron.left")
				.font(.headline)
				.foregroundStyle(.black)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.horizontal)
		  }
		  
		  BeforeAfterImageView(catalogItem: catalogItem)
		  
		  
		  Spacer()
		  
		 bottomSection
		}
	 }
	 
  }
}

#Preview {
  CatalogDetailView(catalogItem: CatalogModel(id: UUID(), name: "First"))
}



extension CatalogDetailView{
  private var bottomSection: some View{
	 VStack{
		HStack{
		  Button{}label: {
			 HStack{
				Image(systemName: "arrow.down.and.line.horizontal.and.arrow.up")
				Text("Resize")
			 }
			 .frame(maxWidth: .infinity)
			 .padding()
			 .background(
				RoundedRectangle(cornerRadius: 30)
				  .fill(.white)
				  .shadow(radius: 1)
			 )
		  }
		  Button{}label: {
			 HStack{
				Image(systemName: "square.and.arrow.down")
				Text("Save")
			 }
			 .frame(maxWidth: .infinity)
			 .padding()
			 .background(
				RoundedRectangle(cornerRadius: 30)
				  .fill(.white)
				  .shadow(radius: 1)
			 )
		  }
		}
		.font(.headline)
		.foregroundStyle(.black)
		
		Button{}label:{
		  HStack{
			 Image(systemName: "arrow.clockwise")
			 Text("Regenerate")
		  }
		  .font(.title2.weight(.medium))
		  .frame(maxWidth: .infinity)
		  .foregroundStyle(.white)
		  .padding()
		  .background(
			 RoundedRectangle(cornerRadius: 30)
				.fill(.black)
		  )
		}
	 }
	 .padding()
  }
}
