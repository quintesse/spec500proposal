native
shared void testMethod() {}

native("jvm")
shared void testMethod() {
    myprintJvm("This is a shared method in the Java backend");
}

native("js")
shared void testMethod() {
    myprintJs("This is a shared method in the JavaScript backend");
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

native("jvm")
void testMethodNativeOnly() {
    myprintJvm("This is a private method in the Java backend");
}

native("js")
void testMethodNativeOnly() {
    myprintJvm("This is a private method in the JavaScript backend");
}
