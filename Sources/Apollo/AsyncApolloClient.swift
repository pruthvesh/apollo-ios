//
//  AsyncApolloClient.swift
//  Apollo
//
//  Created by casting on 11/11/21.
//  Copyright © 2021 Apollo GraphQL. All rights reserved.
//

import Foundation


public class AsyncApolloClient: ApolloClient {
  
  @discardableResult
  public func performAsync<Mutation: GraphQLMutation>(mutation: Mutation,
                                                 publishResultToStore: Bool = true,
                                                 queue: DispatchQueue = .main) -> Result<GraphQLResult<Mutation.Data>, Error> {
    var glResult: Result<GraphQLResult<Mutation.Data>, Error>?
    let sema = DispatchSemaphore(value: 0)
    self.perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue) { result in
      glResult = result
      sema.signal()
    }
    sema.wait()
    return glResult!
  }
  
  
  @discardableResult public func fetchAsync<Query: GraphQLQuery>(query: Query,
                                                            cachePolicy: CachePolicy = .default,
                                                            contextIdentifier: UUID? = nil,
                                                            queue: DispatchQueue = .main) -> Result<GraphQLResult<Query.Data>, Error> {
    var glResult: Result<GraphQLResult<Query.Data>, Error>?
    let sema = DispatchSemaphore(value: 0)
    self.fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: contextIdentifier, queue: queue) { result in
      glResult = result
      sema.signal()
    }
    sema.wait()
    return glResult!
  }
  
}
