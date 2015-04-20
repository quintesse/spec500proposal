
shared void run() {
    testMethod();
    testMethodNativeOnly();
    //print(testAttribute);
    print(TestClass().test());
}

shared interface TestInterface {
    shared formal String test();
}

shared void myprintJvm(String str) {
    print("JVM: " + str);
}

shared void myprintJs(String str) {
    print("JS: " + str);
}
