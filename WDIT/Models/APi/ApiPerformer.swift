import Foundation

private enum ApiPerformerError: Error {
    case InvalidURL
    case DecodeError
}
struct ApiPerformer {
    private let baseURL = "http://numbersapi.com/"
    
    func getRequest(component: String) async throws -> String {
        guard let url = URL(string: baseURL + performDate(date: component) + "/date") else {
            throw ApiPerformerError.InvalidURL
        }
            let content = try String(contentsOf: url)
            return content
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return data
    }
//
//    func decodeData(data: Data) throws -> String {
//        do {
//            let decoded = try JSONDecoder().decode(String.self, from: data)
//            return decoded
//        } catch {
//            throw ApiPerformerError.DecodeError
//        }
//    }
    
    private func performDate(date: String) -> String {
        let dateArray = date.components(separatedBy: "-")
        let result = dateArray[1] + "/" + dateArray[0]
        return result
    }
}
