import com.redhat.ceylon.testjs { run }

native("js")
shared void testBackend() {
    myprintJs(run);
}

native("js")
shared class TestClass() {
    myprintJs("This is a class in the JavaScript backend");
    
    native("js") shared String test() => "JS";
}
