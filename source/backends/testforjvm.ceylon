import ceylon.file { home }

native("jvm")
shared void testBackend() {
    myprintJvm(home);
}

native("jvm")
shared class TestClass() {
    myprintJvm("This is a class in the Java backend");
    
    native("jvm") shared String test() => "JVM";
}
