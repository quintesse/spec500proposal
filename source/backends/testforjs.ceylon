
native("js")
shared class TestClass() {
    myprintJs("This is a class in the JavaScript backend");
    
    shared String test() => "JS";
}
