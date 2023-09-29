//
//  ResponsePersistable.swift
//
//
//  Created by Developer on 29/09/2023.
//

import CoreData

public protocol ResponsePersistable {
    
    associatedtype EntitiyType: NSManagedObject
    associatedtype RequestType: Decodable
    associatedtype ResponseType: Decodable
    
    func fetchRequest(for request: RequestType) -> NSFetchRequest<EntitiyType>
    func fetchResponse(for request: RequestType, completion: @escaping (Result<ResponseType?, CoreDataStoreError>) -> Void)
    func saveResponse(_ response: ResponseType, withRequest request: RequestType)
    func deleteResponse(withRequest request: RequestType, in context: NSManagedObjectContext)
}
