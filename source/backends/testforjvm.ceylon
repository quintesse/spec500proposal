
native("jvm")
shared class TestClass() {
    myprintJvm("This is a class in the Java backend");
    
    shared String test() => "JVM";
}
