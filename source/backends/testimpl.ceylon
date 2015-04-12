import backends { @backend:"jvm" myprint=myprintJvm }
import backends { @backend:"js" myprint=myprintJs }

@backend:"jvm"
shared void testMethod() {
    myprint("This is a method in the Java backend");
}

@backend:"js"
shared void testMethod() {
    myprint("This is a method the JavaScript backend");
}

@backend:"jvm"
shared String testAttribute => "This is an attribute in the Java backend";

@backend:"js"
shared String testAttribute => "This is an attribute in the JavaScript backend";

@backend:"jvm"
shared class TestClass() {
    myprint("This is a class in the Java backend");
}

@backend:"js"
shared class TestClass() {
    myprint("This is a class in the JavaScript backend");
}
