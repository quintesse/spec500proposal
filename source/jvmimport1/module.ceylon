"Only the JVM compiler should be allowed to compile this"
native("java")
module jvmimport1 "1.0.0" {
    import jsonly "1.0.0";
}
