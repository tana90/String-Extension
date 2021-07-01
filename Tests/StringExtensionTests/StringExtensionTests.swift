    import XCTest
    
    final class StringExtensionTests: XCTestCase {
        
        func testSha1() throws {
            let hmacText = "This is a test".sha1
            let trueHmacText = "a54d88e06612d820bc3be72877c74f257b561b19"
            XCTAssertEqual(hmacText, trueHmacText)
        }
        
        func testSanitized() throws {
            let text = "This is a test{{"
            XCTAssertEqual(text.sanitized, "This is a test")
        }
        
        func testDictionary() throws {
            let text = "{\"param1\":\"param1\"}"
            let dic = ["param1": "param1"]
            guard let convertedDic = try text.dictionary() as? [String: String] else { return }
            XCTAssertEqual(convertedDic, dic)
        }
    }
