import Foundation

struct DateResult: Codable {
    let text: String

}
class DateClient {
    private let apiPerformer = ApiPerformer()
    
    func getDate(date: String) async throws -> String{
        let data = try await apiPerformer.getRequest(component: date)
        return data
    }
}
