//
//  NavigationView.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import SwiftUI

struct NavigationView: View {
  @Environment(NavigationManager.self) var navigationManager
  var body: some View {
	 ZStack{
		Color.white.mix(with: .gray, by: 0.05).ignoresSafeArea()
		@Bindable var navigation = navigationManager
		TabView(selection: $navigation.mainNavigation){
		  ForEach(MainNavigation.allCases){item in
			 item.view
				.tag(item)
		  }
		}
		.ignoresSafeArea(edges: .bottom)
		.tabViewStyle(.page(indexDisplayMode: .never))
		.overlay(
		  toolbar,
		  alignment: .bottom
		)
		
		if let catalogItem = navigationManager.secondaryView{
		  CatalogDetailView(catalogItem: catalogItem)
			 .geometryGroup()
			 .zIndex(1)
			 .transition(.move(edge: .trailing).combined(with: .opacity))
			 .allowsHitTesting(navigationManager.secondaryView != nil)
		}
	 }
	 .ignoresSafeArea(edges: .bottom)
  }
}

#Preview {
    NavigationView()
	 .environment(NavigationManager.shared)
}



extension NavigationView{
  
  private var toolbar: some View{
	 HStack{
		ForEach(MainNavigation.allCases){item in
		  let isActive = navigationManager.mainNavigation == item
		  
		  Button{
			 withAnimation(){
				navigationManager.mainNavigation = item
			 }
		  }label: {
			 VStack{
				Image(systemName: item.icon)
				Text(item.text)
			 }
			 .frame(maxWidth: .infinity)
			 .foregroundStyle(isActive ? .black : .gray)
		  }
		}
	 }
		.padding()
		.background(
		  RoundedRectangle(cornerRadius: 30)
			 .fill(.white)
			 .shadow(radius: 1)
		)
		.padding()
  }
  
}
