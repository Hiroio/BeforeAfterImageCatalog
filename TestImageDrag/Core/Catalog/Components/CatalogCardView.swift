//
//  CatalogCardView.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import SwiftUI

struct CatalogCardView: View {
  let catalogItem: CatalogModel
  var body: some View {
	 VStack(alignment: .leading, spacing: 10){
		
		imageSection
		
		VStack(alignment: .leading, spacing: 0){
		  Text(catalogItem.name)
			 .font(.headline)
		  HStack(){
			 Text(catalogItem.desc)
				.font(.headline.weight(.light))
				.foregroundStyle(.gray)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.trailing)
			 
			 
			 Button{
				withAnimation(){
				  NavigationManager.shared.secondaryView = catalogItem
				}
			 }label: {
				Image(systemName: "arrow.right")
				  .padding()
				  .padding(.horizontal, 5)
				  .foregroundStyle(.white)
				  .background(
					 Capsule()
						.fill(.black)
				  )
			 }
		  }
		}
	 }
	 .padding()
	 .background(
		RoundedRectangle(cornerRadius: 30)
		  .fill(.white)
		  .shadow(radius: 1)
	 )
  }
}

#Preview {
  CatalogCardView(catalogItem: .init(id: UUID(), name: "First"))
}


extension CatalogCardView{
  private var imageSection: some View{
	 GeometryReader { geo in
		let middle = geo.size.width / 2
		ZStack(alignment: .leading){
		  Image(catalogItem.image)
			 .resizable()
			 .scaledToFill()
			 .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
			 .frame(width: geo.size.width)
			 .clipped()
		  
		  Image(catalogItem.secondImage)
			 .resizable()
			 .scaledToFill()
			 .frame(width: geo.size.width, height: geo.size.height, alignment: .trailing)
			 .frame(width: middle)
			 .clipped()
		  
		  Rectangle()
			 .fill(.white)
			 .frame(width: 5)
			 .offset(x: middle)
		}
		.clipShape(.rect(cornerRadius: 30))
		.onTapGesture {
		  withAnimation(){
			 NavigationManager.shared.secondaryView = catalogItem
		  }
		}
	 }
	 .frame(maxWidth: .infinity, maxHeight: .infinity)
	 .aspectRatio(2, contentMode: .fit)
  }
}
