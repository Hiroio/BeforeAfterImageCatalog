//
//  CatalogModel.swift
//  TestImageDrag
//
//  Created by user on 16.06.2026.
//

import Foundation


struct CatalogModel: Identifiable{
  var id: UUID
  var name: String
  var desc: String = "Refresh your space with a new interior look"
  var image: String { self.name.lowercased()}
  var secondImage: String {self.name.lowercased() + "2"}
  
  static func getExamples() -> [CatalogModel]{
	 return [CatalogModel(id: UUID(), name: "First"),CatalogModel(id: UUID(), name: "Second"),CatalogModel(id: UUID(), name: "Third"),CatalogModel(id: UUID(), name: "Forth")]
  }
}
