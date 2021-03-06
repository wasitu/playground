import XCTest
import UIKit

public class UITextFieldTestCase: XCTestCase {
    func testCount25() {
        let textField = UITextField()
        textField.text = """
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        """
        XCTAssert(textField.text?.count == 25)
    }
    
    func testCount26() {
        let textField = UITextField()
        textField.text = """
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦👨‍👨‍👧‍👦
        """
        XCTAssert(textField.text?.count == 26)
    }
}

