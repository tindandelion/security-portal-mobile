window.SenchaEventMatchers = 
  toBeFiredWith: (expectedArgs...) -> 
    return false unless @actual.wasCalled
    eventArgs = @actual.mostRecentCall.args[0...-2]
    expect(expectedArgs).toEqual(eventArgs)
    return true
