//
//  BeforeAfterImageView.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import SwiftUI

struct BeforeAfterImageView: View {
  @State private var sliderOffset: CGFloat = 100
  let catalogItem: CatalogModel
    var body: some View {
		GeometryReader{ geo in
		  ZStack(alignment: .leading){
			 /// after
			 afterImage(geo.size)
			 /// before
			 beforeImage(geo.size)
			 
			 customDivider
				.gesture(ImageDragGesture(geo.size.width))
			 
		  }
		  .frame(width: geo.size.width, alignment: .leading)
		  .clipShape(.rect(cornerRadius: 20))
		  .onAppear{
			 withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)){
				sliderOffset = geo.size.width / 2
			 }
		  }
		  
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.aspectRatio(0.8 ,contentMode: .fit)
		.padding()
		.padding(.top)
    }
}

#Preview {
  BeforeAfterImageView(catalogItem: .init(id: UUID(), name: "First"))
}



extension BeforeAfterImageView{
//  MARK: BeforeImage
  private func beforeImage(_ geo: CGSize) -> some View{
	 Image(catalogItem.secondImage)
		.resizable()
		.scaledToFill()
		.frame(maxWidth: geo.width, maxHeight: geo.height, alignment: .leading)
		.overlay(
		  imageTag(false)
			 .animation(.none, value: sliderOffset),
		  alignment: .topLeading
		)
		.frame(width: sliderOffset, alignment: .leading)
		.clipped()
  }
  
//  MARK: AfterImage
  private func afterImage(_ geo: CGSize) -> some View{
	 Image(catalogItem.image)
		.resizable()
		.scaledToFill()
		.frame(width: geo.width, height: geo.height)
		.clipped()
		.overlay(
		  imageTag(true),
		  alignment: .topTrailing
		)
  }
  
//  MARK: Divider
  private var customDivider: some View{
	 Rectangle()
		.fill(.white)
		.frame(width: 4, alignment: .leading)
		.overlay(
		  Image(systemName: "chevron.up.chevron.down")
			 .font(.title2)
			 .rotationEffect(Angle(degrees: 90))
			 .padding(10)
			 .background(
				Circle()
				  .fill(.white)
			 )
		)
		.offset(x: sliderOffset)
  }
  
//  MARK: Before/After Tag
  @ViewBuilder
  private func imageTag(_ after: Bool) -> some View{
	 Text(after ? "After" : "Before")
		.fontWeight(.medium)
		.padding(8)
		.background(
		  Capsule()
			 .fill(.white)
		)
		.padding()
  }
  
//  MARK: Drag Gesture
  func ImageDragGesture(_ maxWidth: CGFloat) -> some Gesture{
	 DragGesture(coordinateSpace: .global)
		.onChanged { value in
		  withAnimation(.easeInOut){
			 print(value.location.x)
			 self.sliderOffset = max(0, min(maxWidth, value.location.x))
		  }
		}
  }
}




