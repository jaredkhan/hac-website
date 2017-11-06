import Foundation

public struct Config {
  public static func envVar(forKey key: String) -> String? {
    return ProcessInfo.processInfo.environment[key]
  }

  public static var listeningPort: Int {
    if let portString = envVar(forKey: "PORT"), let port = Int(portString) {
      return port
    }

    return 8090
  }

  private static func checkEnvVarsExist(for keys: String...) {
    for key in keys {
      guard envVar(forKey: key) != nil else {
        fatalError("Missing environment variable: \(key)")
      }
    }
  }

  public static func checkEnvVars() {
    checkEnvVarsExist(for: "DATA_DIR", "BACKEND_JS_DIR")
  }
}
