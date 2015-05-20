
native
shared void testMethod();

// EXPECTED ERROR: duplicate native abstraction: 'testMethod'
//native
//shared void testMethod();

native("java")
shared void testMethod() {
    myprintJvm("This is a shared method in the Java backend");
}

native("js")
shared void testMethod() {
    myprintJs("This is a shared method in the JavaScript backend");
}

native
shared void testBackend();

// EXPECTED ERROR: duplicate native implementation: 'testMethod'
//native("js")
//shared void testMethod() {
//    myprintJs("This is a shared method in the JavaScript backend");
//}

// EXPECTED ERROR: invalid native backend name: 'foo', should be one of: jvm, js
//native("foo")
//shared void testMethod() {
//    myprintJs("This is a shared method in the JavaScript backend");
//}

native
shared String testAttribute;

native("java")
shared String testAttribute => "This is a shared attribute in the Java backend";

native("js")
shared String testAttribute => "This is a shared attribute in the JavaScript backend";

native("java")
String testAttributeNativeOnly => "This is a private attribute in the Java backend";

native("js")
String testAttributeNativeOnly => "This is a private attribute in the JavaScript backend";

native
shared class TestClass() {
    native shared String test();
}

native
shared class TestClassWithInterface() satisfies TestInterface {
    native shared actual String test();
}

native("java")
shared class TestClassWithInterface() satisfies TestInterface {
    myprintJvm("This is a class with interface in the Java backend");
    
    shared actual String test() => "JVM";
}

native("js")
shared class TestClassWithInterface() satisfies TestInterface {
    myprintJvm("This is a class with interface in the JavaScript backend");
    
    shared actual String test() => "JS";
}

native("java")
void testMethodNativeOnly() {
    myprintJvm("This is a private method in the Java backend");
}

native("js")
void testMethodNativeOnly() {
    myprintJs("This is a private method in the JavaScript backend");
}

// EXPECTED ERROR: native abstraction should be shared
//native
//void testMethodNotShared();
//
// EXPECTED ERROR: native implementation should be shared
//native("java")
//void testMethodNotShared() {}

// EXPECTED ERROR: native implementation should have an abstraction or not be shared
//native("java")
//shared void testMethodNativeOnlyShared() {
//}

// EXPECTED ERROR: only toplevel classes and methods can be marked native
//shared class TestContainer() {
//    native("java")
//    shared void test() {}
//}

