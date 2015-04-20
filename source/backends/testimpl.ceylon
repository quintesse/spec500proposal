
native
shared void testMethod();

// EXPECTED ERROR: duplicate native abstraction: 'testMethod'
//native
//shared void testMethod();

native("jvm")
shared void testMethod() {
    myprintJvm("This is a shared method in the Java backend");
}

native("js")
shared void testMethod() {
    myprintJs("This is a shared method in the JavaScript backend");
}

// EXPECTED ERROR: duplicate native implementation: 'testMethod'
//native("js")
//shared void testMethod() {
//    myprintJs("This is a shared method in the JavaScript backend");
//}

// EXPECTED ERROR: invalid backend name: 'foo', should be one of: jvm, js
//native("foo")
//shared void testMethod() {
//    myprintJs("This is a shared method in the JavaScript backend");
//}

native
shared class TestClass();

native
shared class TestClassWithInterface() satisfies TestInterface;

native("jvm")
shared class TestClassWithInterface() satisfies TestInterface {
    myprintJvm("This is a class with interface in the Java backend");
    
    shared actual String test() => "JVM";
}

native("js")
shared class TestClassWithInterface() satisfies TestInterface {
    myprintJvm("This is a class with interface in the JavaScript backend");
    
    shared actual String test() => "JS";
}

native("jvm")
void testMethodNativeOnly() {
    myprintJvm("This is a private method in the Java backend");
}

native("js")
void testMethodNativeOnly() {
    myprintJs("This is a private method in the JavaScript backend");
}

// EXPECTED ERROR: only toplevel classes and methods can be marked native
//shared class TestContainer() {
//    native("jvm")
//    shared void test() {}
//}

// NOT SUPPORTED YET
//native
//shared String testAttribute;
//
//native("jvm")
//shared String testAttribute => "This is an attribute in the Java backend";
//
//native("js")
//shared String testAttribute => "This is an attribute in the JavaScript backend";

