*** Setting ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}    http://216.10.245.166
${get_url}    Library/GetBook.php
${post_url}    Library/Addbook.php
${delete_url}    Library/DeleteBook.php
${book_ID}

*** Test Cases ***

Create the book using post method - UAT
    &{post_payload}=    Create Dictionary    name=Learn Appium Automation with Java    isbn=bacd    aisle=229    author=John foe

    ${post_req}=    POST    ${base_url}/${post_url}    json=${post_payload}    expected_status=200
    ${post_json}=    Set Variable   ${post_req.json()}

    Dictionary Should Contain Key    ${post_json}    ID

    ${book_ID}=    Get From Dictionary    ${post_json}    ID

    Set Global Variable    ${book_ID}

    # Log    ${post_json[ID]}

    Should Be Equal As Strings    successfully added    ${post_json['Msg']}
    Status Should Be    200    ${post_req}







    
