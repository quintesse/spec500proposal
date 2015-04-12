
shared void run() {
    testMethod();
    print(testAttribute);
    TestClass();
    fileTest();
    InClassTest().test();
    inMethod();
}

shared void myprintJvm(String str) {
    print("JVM: " + str);
}

shared void myprintJs(String str) {
    print("JS: " + str);
}

shared class InClassTest() {
    @backend:"jvm"
    shared void test() {
        myprintJvm("This is a method for the Java backend within a class");
    }
    
    @backend:"js"
    shared void test() {
        myprintJs("This is a method for the JavaScript backend within a class");
    }
}

shared void inMethod() {
    @backend:"jvm"
    void test() {
        myprintJvm("This is a method for the Java backend within another method");
    }
    
    @backend:"js"
    void test() {
        myprintJs("This is a method for the JavaScript backend within another method");
    }
    
    test();
}
