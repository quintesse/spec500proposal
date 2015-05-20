import ceylon.file { home }

native("java")
shared void testBackend() {
    myprintJvm(home);
}

native("java")
shared class TestClass() {
    myprintJvm("This is a class in the Java backend");
    
    shared String test() => "JVM";
}
