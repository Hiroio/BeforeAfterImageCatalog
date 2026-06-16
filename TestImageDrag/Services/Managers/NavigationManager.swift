//
//  NavigationManager.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import Foundation
import SwiftUI

@Observable
final class NavigationManager{
  static let shared = NavigationManager()
  
  private init() {}
  
  var mainNavigation: MainNavigation = .tools
  
  var secondaryView: CatalogModel? = nil
}




enum MainNavigation: String ,Identifiable, CaseIterable{
  case tools, gallery, discover
  
  var id: String {self.rawValue}
  
  var text: String {
	 self.rawValue.capitalized
  }
  
  var icon: String{
	 switch self {
	 case .tools:
		"sparkles"
	 case .gallery:
		"photo.on.rectangle"
	 case .discover:
		"safari.fill"
	 }
  }
  
  
  @ViewBuilder
  var view: some View{
	 switch self {
	 case .tools:
		CatalogView()
	 case .gallery, .discover:
		Text("\(self.rawValue)")
	 }
  }
}
