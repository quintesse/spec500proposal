"Only the JS compiler should be allowed to compile this"
native("js")
module jsimport1 "1.0.0" {
    import jvmonly "1.0.0";
}
