"Only the JS compiler should be allowed to compile this"
native("js")
module jsimport2 "1.0.0" {
    native("jvm") import jsonly "1.0.0";
}
