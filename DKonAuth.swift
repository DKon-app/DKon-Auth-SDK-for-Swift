import Foundation

public class DKonAuth {
    private let clientId: String
    private let apiUrl: String

    public init(clientId: String) {
        self.clientId = clientId
        self.apiUrl = "https://api.dkon.app/api/v3/method/account.signIn"
    }

    public func login(username: String, password: String, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        var request = URLRequest(url: URL(string: apiUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "clientId": clientId,
            "username": username,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let decoder = JSONDecoder()
                let authResponse = try decoder.decode(AuthResponse.self, from: data)
                if let errorCode = authResponse.error_code, errorCode != 0 {
                    let error = NSError(domain: "", code: errorCode, userInfo: [NSLocalizedDescriptionKey: authResponse.message ?? "Login failed"])
                    completion(.failure(error))
                } else {
                    completion(.success(authResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

// AuthResponse struct to decode the JSON response
public struct AuthResponse: Codable {
    let accessToken: String?
    let accountId: String?
    let error_code: Int?
    let message: String?
}
