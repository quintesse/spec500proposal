import com.redhat.ceylon.testjs { run }
import ceylon.file { home }

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

native
shared void testBackend();

// EXPECTED ERROR: duplicate native implementation: 'testMethod'
//native("js")
//shared void testMethod() {
//    myprintJs("This is a shared method in the JavaScript backend");
//}

// EXPECTED ERROR: invalid native backend name: 'foo', should be one of: jvm, js
//native("foo")
//shared void testMethod() {
//    myprintJs("This is a shared method in the JavaScript backend");
//}

native
shared String testAttribute;

native("jvm")
shared String testAttribute => "This is a shared attribute in the Java backend";

native("js")
shared String testAttribute => "This is a shared attribute in the JavaScript backend";

native
String testAttributeNativeOnly;

native("jvm")
String testAttributeNativeOnly => "This is a private attribute in the Java backend";

native("js")
String testAttributeNativeOnly => "This is a private attribute in the JavaScript backend";

native
shared class TestClass() {
    native shared String test();
}

native
shared class TestClassWithInterface() satisfies TestInterface {
    native shared actual String test();
}

native("jvm")
shared class TestClassWithInterface() satisfies TestInterface {
    myprintJvm("This is a class with interface in the Java backend");
    
    native("jvm") shared actual String test() => "JVM";
}

native("js")
shared class TestClassWithInterface() satisfies TestInterface {
    myprintJvm("This is a class with interface in the JavaScript backend");
    
    native("js") shared actual String test() => "JS";
}

native
void testMethodNativeOnly();

native("jvm")
void testMethodNativeOnly() {
    myprintJvm("This is a private method in the Java backend");
}

native("js")
void testMethodNativeOnly() {
    myprintJs("This is a private method in the JavaScript backend");
}

// EXPECTED ERROR: native abstraction should be shared
//native
//void testMethodNotShared();
//
// EXPECTED ERROR: native implementation should be shared
//native("jvm")
//void testMethodNotShared() {}

// EXPECTED ERROR: native implementation should have an abstraction or not be shared
//native("jvm")
//shared void testMethodNativeOnlyShared() {
//}

// EXPECTED ERROR: only toplevel classes and methods can be marked native
//shared class TestContainer() {
//    native("jvm")
//    shared void test() {}
//}

native("jvm")
shared void testBackend() {
    myprintJvm(home);
}

native("jvm")
shared class TestClass() {
    myprintJvm("This is a class in the Java backend");
    
    native("jvm") shared String test() => "JVM";
}



native("js")
shared void testBackend() {
    myprintJs(run);
}

native("js")
shared class TestClass() {
    myprintJs("This is a class in the JavaScript backend");
    
    native("js") shared String test() => "JS";
}

native
shared void testMethodDefaultImpl1() {
    print("This method has a default implementation #1");
}

native("js")
shared void testMethodDefaultImpl1() {
    myprintJs("This method has a default implementation #1, but is overriden for JS");
}

native
shared void testMethodDefaultImpl2() {
    print("This method has a default implementation #2");
}

native("jvm")
shared void testMethodDefaultImpl2() {
    myprintJvm("This method has a default implementation #2, but is overriden for JVM");
}

native
shared String testAttributeDefaultImpl1 =>
    "This attribute has a default implementation #1";

native("js")
shared String testAttributeDefaultImpl1 =>
    "This attribute has a default implementation #1, but is overriden for JS";

native
shared String testAttributeDefaultImpl2 =>
    "This attribute has a default implementation #2";

native("jvm")
shared String testAttributeDefaultImpl2 =>
    "This attribute has a default implementation #2, but is overriden for JVM";

shared class NativeClassWithImplBase(Integer i) {
    shared String base() => "Method in base class of native class ``i``";
}

native shared class NativeClassWithImpl(Integer x, Integer y)
        extends NativeClassWithImplBase(x) {
    native shared String meth() => "Method in native header class ``x`` ``y``";
    native shared String attr => "Attribute in native header class ``x`` ``y``";
    native shared void test2() {}
    shared String nat() => "Non-native method in native header class ``x`` ``y``";
}

native("jvm") shared class NativeClassWithImpl(Integer x, Integer y)
        extends NativeClassWithImplBase(x) {
    String jvmimpl() => "Non-shared JVM method in native implementation class";
    native("jvm") shared void test2() {
        print(base());
        print(meth());
        print(attr);
        print(nat());
        print(jvmimpl());
    }
}

native("js") shared class NativeClassWithImpl(Integer x, Integer y)
        extends NativeClassWithImplBase(x) {
    String jsimpl() => "Non-shared JS method in native implementation class";
    native("js") shared void test2() {
        print(base());
        print(meth());
        print(attr);
        print(nat());
        print(jsimpl());
    }
}
