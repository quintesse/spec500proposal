native
shared void testMethod() {}

native("jvm")
shared void testMethod() {
    myprintJvm("This is a method in the Java backend");
}

native("js")
shared void testMethod() {
    myprintJs("This is a method the JavaScript backend");
}

//native
//shared String testAttribute;
//
//native("jvm")
//shared String testAttribute => "This is an attribute in the Java backend";
//
//native("js")
//shared String testAttribute => "This is an attribute in the JavaScript backend";

native
shared class TestClass() {}

// TODO make sure the typechecker enforces this to be non-shared
native("jvm")
void testMethodNativeOnly() {
    myprintJvm("This is a method in the Java backend");
}
