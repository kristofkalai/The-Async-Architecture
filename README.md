# The-Async-Architecture
A safe, async-await based architecture for developing high-performing iOS applications! 📱

## Setup

Add the following to `Package.swift`:

```swift
.package(url: "https://github.com/stateman92/The-Async-Architecture", exact: .init(0, 0, 3))
```

[Or add the package in Xcode.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

For details see the Example app.

## The architecture in details

```swift
                             ┌───────────────────────────┐                                
                             │ View / Screen             │                                
                             ├───────────────────────────┤                                
                             │                           │                                
                             │                           │                                
                             │   ┌──────► UI ───────┐    │                                
                             │   │                  ▼    │                                
                             │ State             Command │                                
                             │                           │                                
                             └──────────────────────┬────┘                                
                                 ▲                  │                                     
                                 │                  │                                     
                                 │                  ▼                                     
                      ┌──────────┴───────────────────────────────┐                        
                      │ ViewModel                                │                        
                      ├──────────────────────────────────────────┤                        
                      │                                          │                        
                      │ - state: State                           │                        
                ┌─────┤                                          │◄────┐                  
                │     │ - receive(command: Command) async        │     │                  
                │     │                                          │     │                  
                │     │ ...                                      │     │                  
                │     └──────────────────────────────────────────┘     │                  
                │                                                      │                  
                │                                                      │                  
                │                                                      │                  
                │                                                      │                  
                │                                                      │                  
                ▼                                                      │                  
┌──────────────────────────────────────────┐  ┌────────────────────────┴─────────────────┐
│ Action                                   │  │ Store                                    │
├──────────────────────────────────────────┤  ├──────────────────────────────────────────┤
│                                          │  │                                          │
│ - method1() async throws                 │  │ - variable1: AnyPublisher<Value1, Never> │
│                                          │  │                                          │
│ - method2() async throws                 │  │ - variable2: AnyPublisher<Value2, Never> │
│                                          │  │                                          │
│ ...                                      │  │ ...                                      │
└───────────────┬──────────────────────────┘  └──────────────────────────────────────────┘
                │                                                      ▲                  
                │                                                      │                  
                │                                                      │                  
                │                                                      │                  
                │                                                      │                  
                │                                                      │                  
                │     ┌──────────────────────────────────────────┐     │                  
                │     │ Cache<T>                                 │     │                  
                │     ├──────────────────────────────────────────┤     │                  
                │     │                                          │     │                  
                │     │ - value() -> AnyPublisher<T, Never>      │     │                  
                └────►│                                          ├─────┘                  
                      │ - save(item: T)                          │                        
                      │                                          │                        
                      │ ...                                      │                        
                      └────────────┬─────────┬────────┬──────────┘                        
                                   │         │        │                                   
                                   │         │        │                                   
                                   │         │        │                                   
                                   ▼         ▼        ▼                                   
                                Network, Database, Service                                
                                                                                          
                                            ...                                           
```

## Supported features

- Using UIKit or SwiftUI as you like,
- Use `ViewModel`s (and their `state`) as a single source of truth:
  - No more inconsistent states, since there is only one `struct`, that defines the state,
  - No more spaghetti code between the `View` and `ViewModel`, since these two can communicate only via predefined commands.
- Pass parameters between screens,
- Use decoupled navigation from the UI,
- Use the cutting-edge async-await syntax at the `Action` layer, but use the good old Combine framework at the `Store` layer. This enables better error handling and readability for the actions, while it doesn't need any custom property wrappers to connect to SwiftUI and helps avoiding common mistakes that can happen while using async sequences
  - How to pass values around the two different asynchronous world?
    - From Combine to async-await: there are two example for this, namely using async calls in `.sink` and in `.flatMap`. Based on these other operators should be feasible to implement,
    - From async-await to Combine: the `Action`'s `async` calls can execute synchronous code too. It can call the `Cache`'s appropriate method, which turns the incoming value into a publisher through its `value()` method.
