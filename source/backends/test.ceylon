
shared void runit() {
    testMethod();
    testBackend();
    testMethodNativeOnly();
    print(testAttribute);
    print(testAttributeNativeOnly);
    print(TestClass().test());
    print(TestClassWithInterface().test());
    testNative();
    testMethodDefaultImpl1();
    testMethodDefaultImpl2();
    print(testAttributeDefaultImpl1);
    print(testAttributeDefaultImpl2);
}

shared interface TestInterface {
    shared formal String test();
}

shared void myprintJvm(Object str) {
    print("JVM: " + str.string);
}

shared void myprintJs(Object str) {
    print("JS: " + str.string);
}

native void testNative();

native("jvm") void testNative() {
    myprintJvm(NativeCode().test());
}

native("js") void testNative() {
    dynamic {
        myprintJs(nativeCode());
    }
}
