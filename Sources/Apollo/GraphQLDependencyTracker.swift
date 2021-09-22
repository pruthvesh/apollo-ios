final class GraphQLDependencyTracker: GraphQLResultAccumulator {
  private var dependentKeys: Set<CacheKey> = Set()

  func accept(scalar: JSONValue, info: FieldExecutionInfo) {
    dependentKeys.insert(info.cachePath.joined)
  }

  func acceptNullValue(info: FieldExecutionInfo) {
    dependentKeys.insert(info.cachePath.joined)
  }

  func accept(list: [Void], info: FieldExecutionInfo) {
    dependentKeys.insert(info.cachePath.joined)
  }

  func accept(childObject: Void, info: FieldExecutionInfo) {
  }

  func accept(fieldEntry: Void, info: FieldExecutionInfo) -> Void? {
    dependentKeys.insert(info.cachePath.joined)
    return ()
  }

  func accept(fieldEntries: [Void], info: ObjectExecutionInfo) {
  }

  func finish(rootValue: Void) -> Set<CacheKey> {
    return dependentKeys
  }
}
