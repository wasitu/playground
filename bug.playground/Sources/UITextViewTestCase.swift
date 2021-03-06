import XCTest
import UIKit

public class UITextViewTestCase: XCTestCase {
    func testCount25() {
        let textView = UITextView()
        textView.text = """
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        """
        XCTAssert(textView.text?.count == 25)
    }
    
    func testCount26() {
        let textView = UITextView()
        textView.text = """
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        """
        XCTAssert(textView.text?.count == 26)
    }
}
