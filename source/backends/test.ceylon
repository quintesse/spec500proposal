
shared void run() {
    testMethod();
    testMethodNativeOnly();
    TestClass();
}

shared void myprintJvm(String str) {
    print("JVM: " + str);
}

shared void myprintJs(String str) {
    print("JS: " + str);
}
